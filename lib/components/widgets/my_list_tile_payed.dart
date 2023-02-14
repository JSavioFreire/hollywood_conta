import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';

class MyListTilePayed extends StatelessWidget {
  final Bill bill;
  const MyListTilePayed({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(bill.company)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'R\$ ${bill.value}',
                  style:
                      const TextStyle(color: ThemeColors.myGreen, fontSize: 24),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
