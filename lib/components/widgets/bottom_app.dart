import 'package:flutter/material.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class MyBottomApp extends StatefulWidget {
  const MyBottomApp({super.key});

  @override
  State<MyBottomApp> createState() => _MyBottomAppState();
}

class _MyBottomAppState extends State<MyBottomApp> {
  int controllerPage = 0;
  @override
  Widget build(BuildContext context) {
    Color color1 = controllerPage == 0 ? Colors.white : ThemeColors.myGrey;
    Color color2 = controllerPage == 1 ? Colors.white : ThemeColors.myGrey;

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
                  children: [
                    Icon(
                      Icons.attach_money_rounded,
                      color: color1,
                    ),
                    Text(
                      'Contas a pagar',
                      style: TextStyle(color: color1),
                    )
                  ],
                ),
                onPressed: () {
                  value.changePageButton(0);
                  setState(() {
                    controllerPage = 0;
                  });
                },
              ),
              TextButton(
                child: Column(
                  children: [
                    Icon(
                      Icons.moving_outlined,
                      color: color2,
                    ),
                    Text(
                      'Contas pagas',
                      style: TextStyle(color: color2),
                    )
                  ],
                ),
                onPressed: () {
                  value.changePageButton(1);
                  setState(() {
                    controllerPage = 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
