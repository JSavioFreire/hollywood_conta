import 'package:flutter/material.dart';
import 'package:hollywood_conta/components/widgets/dismissible.dart';
import 'package:hollywood_conta/model/bill_model.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';

class MyListTile extends StatelessWidget {
  final Bill bill;
  const MyListTile({required this.bill, super.key});

  @override
  Widget build(BuildContext context) {
    return MyDismissible(
      bill: bill,
      inside: Container(
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
                  style: const TextStyle(fontSize: 22),
                ),
                Text(bill.company)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'R\$ ${bill.value}',
                    style: const TextStyle(
                        color: ThemeColors.myGreen, fontSize: 24),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
