import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './components.dart';
import './config/applepay.dart';
import 'package:pay/pay.dart';

import 'config/gpay.dart';
import 'controller/itens_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // instanciando o controller
  var controllerItens = Get.find<ItensController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pagamentos"),
        ),
        body: Obx(() => ListView(
              children: [
                // listando todos os elementos
                for (var item in controllerItens.todosItens)
                  Components.elementoItem(item),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Seus produtos \n Total a pagar: R\$ ${controllerItens.totalPagar()}'),
                ),
                // mostrando seus elementos
                for (var item in controllerItens.itensSelecionadosListView)
                  Components.elementoItem(item, selecionados: true)
              ],
            )),
        // fazendo a verificação se o celular é Android ou iOS
        // são esses botôes que tem conecção com a api do Gpay ou ApplePay
        floatingActionButton: Theme.of(context).platform ==
                TargetPlatform.android
            ? GooglePayButton(
                paymentConfiguration:
                    PaymentConfiguration.fromJsonString(defaultConfigGpay),
                onPaymentResult: (response) {
                  log('essa é a resposta $response');
                },
                type: GooglePayButtonType.pay,
                onPressed: () => {},
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),

                // passamos nossa lista de elementos selecionados aqui
                paymentItems: controllerItens.itensSelecionados)
            : ApplePayButton(
                paymentConfiguration:
                    PaymentConfiguration.fromJsonString(defaultConfigApplepay),

                // passamos nossa lista de elementos selecionados aqui
                paymentItems: controllerItens.itensSelecionados,
                style: ApplePayButtonStyle.black,
                type: ApplePayButtonType.buy,
                width: 200,
                height: 50,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (valor) {
                  log('$valor');
                },
                onError: (erro) {
                  log('$erro');
                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
