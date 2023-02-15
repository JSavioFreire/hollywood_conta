import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class MyListTilePayed extends StatelessWidget {
  final Bill bill;
  const MyListTilePayed({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);

    return InkWell(
      onLongPress: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                  'Você tem certeza?',
                  style: TextStyle(color: ThemeColors.myBlack),
                ),
                content: const Text(
                  'Você deseja mesmo deletar essa conta?',
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Não'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Sim'),
                    onPressed: () {
                      provider.deletePayed(bill);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bill.name,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(bill.company),
                Text(
                  'R\$ ${bill.value}',
                  style:
                      const TextStyle(color: ThemeColors.myGreen, fontSize: 24),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Pago em:',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(bill.payDay),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Vencimento',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(bill.payDay),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
