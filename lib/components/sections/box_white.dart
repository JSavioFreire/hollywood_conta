import 'package:flutter/material.dart';

class BoxWhite extends StatelessWidget {
  const BoxWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          ),
        ),
      ],
    );
  }
}
