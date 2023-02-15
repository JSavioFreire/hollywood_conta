import 'package:flutter/material.dart';
import 'package:hollywood_conta/components/widgets/modal_and_form/modal.dart';

class MyFAB extends StatelessWidget {
  const MyFAB({super.key});

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      onPressed: () => showModal(context),
      child: const Icon(Icons.add),
    );
  }
}
