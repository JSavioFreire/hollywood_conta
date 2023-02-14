import 'package:flutter/material.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class MyBottomApp extends StatelessWidget {
  const MyBottomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => BottomAppBar(
        color: ThemeColors.myBlue,
        height: 56,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                child: Column(
                  children: const [
                    Icon(Icons.attach_money_rounded),
                    Text(
                      'Contas a pagar',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                onPressed: () {
                  value.changePageButton(0);
                },
              ),
              TextButton(
                child: Column(
                  children: const [
                    Icon(Icons.moving_outlined),
                    Text(
                      'Contas pagas',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                onPressed: () {
                  value.changePageButton(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
