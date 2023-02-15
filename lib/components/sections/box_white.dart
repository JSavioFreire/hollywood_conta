import 'package:flutter/material.dart';
import 'package:hollywood_conta/provider/provider.dart';
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              child: Column(children: [
                Row(
                  children: [Text(value.currentDate.month.toString())],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
