import 'package:flutter/material.dart';
import 'package:hollywood_conta/components/widgets/modal.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:provider/provider.dart';

class MyFAB extends StatelessWidget {
  const MyFAB({super.key});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);

    return FloatingActionButton(
      onPressed: () => showModal(context),
      child: const Icon(Icons.add),
    );
  }
}
