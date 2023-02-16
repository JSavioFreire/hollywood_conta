import 'package:flutter/material.dart';
import 'package:hollywood_conta/components/widgets/box_white/month_box_white.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class BoxWhite extends StatelessWidget {
  const BoxWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MonthBoxWhite(
                      otherMonth: 1,
                    ),
                    const MonthBoxWhite(
                      otherMonth: 0,
                    ),
                    const MonthBoxWhite(
                      otherMonth: -1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total de contas pagas: ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'R\$ ${value.totalAllPayed.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 20, color: ThemeColors.myGreen),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total de contas a pagar:',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'R\$ ${value.totalAll.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 20, color: ThemeColors.myYellow),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
