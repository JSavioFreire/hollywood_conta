import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';

class MyListTile extends StatelessWidget {
  final Bill bill;
  const MyListTile({required this.bill, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Column(
            children: [Text(bill.name),],
          ),
          Column()
        ],
      ),
    );
  }
}
