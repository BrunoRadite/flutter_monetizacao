import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller/itens_controller.dart';
import 'package:pay/pay.dart';

class Components {
  static elementoItem(PaymentItem item, {bool selecionados = false}) {
    // instanciando o controller
    var controller = Get.find<ItensController>();
    // pegando a quantidade de elementos iguais
    int quantSelecionados = 0;
    if (selecionados) {
      // percorrendo todos os selecionados
      for (var i in controller.itensSelecionados) {
        // se o item recebido for igual ao atual item adiciona um na quantidade
        if (i == item) {
          quantSelecionados++;
        }
      }
    }

    // retornando o elemento visual
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.label ?? 'Produto sem nome',
                overflow: TextOverflow.ellipsis),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('R\$ ${item.amount}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: selecionados
                      ? Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // removendo um elemento parecido com o atual
                                  controller.itensSelecionados.remove(item);
                                  controller.addItensSelecionadosListView();

                                  // caso quantidade seja igual a um será removido tmabem do visual pois não terá mais nenhum elemento daquele jeito
                                  if (quantSelecionados == 1) {
                                    controller.itensSelecionadosListView
                                        .remove(item);
                                  }
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(161, 244, 67, 54),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50))),
                                  child: const Icon(Icons.remove),
                                ),
                              ),

                              // Somente mostrando a quantidade de elementos iguais
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(160, 244, 235, 54),
                                ),
                                child: Center(
                                    child: Text(
                                  'x$quantSelecionados',
                                  style: const TextStyle(fontSize: 17),
                                )),
                              ),

                              InkWell(
                                onTap: () {
                                  // adicionando mais um elemento daquele na lista
                                  controller.itensSelecionados.add(item);
                                  controller.addItensSelecionadosListView();
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(160, 54, 244, 70),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          bottomRight: Radius.circular(50))),
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        )
                      : FloatingActionButton(
                          onPressed: () {
                            // adicionando mais um elemento daquele na lista
                            controller.itensSelecionados.add(item);
                            controller.addItensSelecionadosListView();
                          },
                          child: const Icon(Icons.add_shopping_cart),
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
