import 'package:flutter/material.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => Scaffold(
        body: ListView.builder(
          itemCount: value.listBill.length,
          itemBuilder: (context, index) => Text(value.listBill[index].name),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          value.refresh();
        }),
      ),
    );
  }
}
