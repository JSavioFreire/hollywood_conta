import 'package:flutter/material.dart';
import 'package:hollywood_conta/components/widgets/modal_and_form/text_form_date.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:provider/provider.dart';

showModal(context, {billEdit}) {
  MyProvider provider = Provider.of<MyProvider>(context, listen: false);
  String title = 'Adicionar nova conta';
  provider.resetController();

  if (billEdit != null) {
    title = 'Editar ${billEdit.name}';
    provider.nameController.text = billEdit.name;
    provider.companyController.text = billEdit.company;
    provider.payDayController = billEdit.payDay;
    provider.valueController.text = billEdit.value;
  }

  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  30, 50, 30, MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 24),
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(label: Text('Nome da conta')),
                    controller: provider.nameController,
                    keyboardType: TextInputType.name,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(label: Text('Beneficiário')),
                    controller: provider.companyController,
                    keyboardType: TextInputType.name,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Valor')),
                    controller: provider.valueController,
                    keyboardType: TextInputType.number,
                  ),
                  FormDate(payDayController: provider.payDayController),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancelar')),
                        ElevatedButton(
                            onPressed: () {
                              provider.toDb(billEdit: billEdit);
                              Navigator.pop(context);
                            },
                            child: const Text('Salvar'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
}
