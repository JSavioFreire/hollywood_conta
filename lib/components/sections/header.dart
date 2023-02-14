import 'package:flutter/material.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ThemeColors.myBlue,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.only(top: 55, left: 25),
        child: Text(
          'Seja bem-vindo, Sávio Freire',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
