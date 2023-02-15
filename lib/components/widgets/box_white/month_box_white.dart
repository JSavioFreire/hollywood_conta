import 'package:flutter/material.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MonthBoxWhite extends StatelessWidget {
  final int otherMonth;
  const MonthBoxWhite({super.key, required this.otherMonth});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, value, child) {
      DateTime month = DateTime(
          value.currentDate.year, value.currentDate.month - otherMonth);
      return Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              DateFormat("MMM").format(month).toString(),
              style: const TextStyle(
                  fontSize: 35, color: ThemeColors.myBlackLight),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const LinearProgressIndicator(
                      value: 0.5,
                      minHeight: 12,
                      color: ThemeColors.myGreen,
                      backgroundColor: ThemeColors.myRedOpacity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Pago:10597,54'),
                      Text('Restante:10597,54')
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
