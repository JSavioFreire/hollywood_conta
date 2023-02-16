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
                    child: LinearProgressIndicator(
                      value: otherMonth == 0
                          ? value.porcentCurrentMonth
                          : otherMonth == 1
                              ? value.porcentPrevMonth
                              : value.porcentNextMonth,
                      minHeight: 12,
                      color: ThemeColors.myGreen,
                      backgroundColor: ThemeColors.myRedOpacity,
                    ),
                  ),
                  otherMonth == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Pago: ${value.currentMonthAllPayed.toStringAsFixed(2)}'),
                            Text(
                                'Restante: ${value.currentMonthAll.toStringAsFixed(2)}')
                          ],
                        )
                      : otherMonth == 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Pago: ${value.prevMonthAllPayed.toStringAsFixed(2)}'),
                                Text(
                                    'Restante: ${value.prevMonthAll.toStringAsFixed(2)}')
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Pago: ${value.nextMonthAllPayed.toStringAsFixed(2)}'),
                                Text(
                                    'Restante: ${value.nextMonthAll.toStringAsFixed(2)}')
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
