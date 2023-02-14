import 'package:flutter/material.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:provider/provider.dart';

showModal(context) {
  MyProvider provider = Provider.of<MyProvider>(context, listen: false);

  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Column(
            children: [
              TextFormField(
                controller: provider.nameController,
              ),
              TextFormField(
                controller: provider.companyController,
              ),
              TextFormField(
                controller: provider.payDayController,
              ),
              TextFormField(
                controller: provider.valueController,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar')),
                  ElevatedButton(
                      onPressed: () {
                        provider.toDb();
                        Navigator.pop(context);
                      },
                      child: const Text('Salvar'))
                ],
              )
            ],
          ));
}
