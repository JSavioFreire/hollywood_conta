import 'package:flutter/material.dart';
import 'package:hollywood_conta/components/sections/box_white.dart';
import 'package:hollywood_conta/components/sections/header.dart';
import 'package:hollywood_conta/components/sections/bills_section.dart';
import 'package:hollywood_conta/components/widgets/bottom_app.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MyProvider provider = Provider.of<MyProvider>(context, listen: false);
      provider.refresh();

      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: ThemeColors.myWhite,
      body: Stack(children: const [
        BillSection(),
        Header(),
        BoxWhite(),
      ]),
      floatingActionButton:
          FloatingActionButton(onPressed: () => provider.showModal(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomApp()
    );
  }
}
