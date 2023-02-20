import 'package:get/get.dart';
import 'package:pay/pay.dart';

class ItensController extends GetxController {
  // calculando o total a se pagar
  totalPagar() {
    double total = 0.0;
    print(itensSelecionados);
    for (var item
        in itensSelecionados.where((p0) => p0.type != PaymentItemType.total)) {
      total += double.parse(item.amount);
      print('item ${item.amount}');
      print(total);
    }
    return total.toString();
  }

  // Todos os itens que podemos selecionar
  RxList<PaymentItem> todosItens = <PaymentItem>[
    const PaymentItem(
      label: 'Exemplo 1',
      amount: '2.00',
      type: PaymentItemType.item,
      status: PaymentItemStatus.final_price,
    ),
    const PaymentItem(
      label: 'Exemplo 2',
      amount: '0.50',
      type: PaymentItemType.item,
      status: PaymentItemStatus.final_price,
    ),
    const PaymentItem(
      label: 'Exemplo 3',
      amount: '1.0',
      type: PaymentItemType.item,
      status: PaymentItemStatus.final_price,
    ),
  ].obs;

  // Itens que o usuário selecionou
  RxList<PaymentItem> itensSelecionados = <PaymentItem>[].obs;

  // Itens que serão mostrados com base nos selecionados
  RxList<PaymentItem> itensSelecionadosListView = <PaymentItem>[].obs;

  // alimentando os itens que serão mostrados e atualizando o total a se pagar
  addItensSelecionadosListView() {
    for (var item in itensSelecionados) {
      if (!itensSelecionadosListView.contains(item) &&
          item.type != PaymentItemType.total) {
        itensSelecionadosListView.add(item);
      }
    }
    itensSelecionados
        .removeWhere((element) => element.type == PaymentItemType.total);
    itensSelecionados.add(PaymentItem(
      label: 'total a se pagar',
      type: PaymentItemType.total,
      amount: totalPagar(),
      status: PaymentItemStatus.final_price,
    ));
  }
}
