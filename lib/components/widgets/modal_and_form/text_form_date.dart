import 'package:flutter/material.dart';

class FormDate extends StatefulWidget {
  DateTime payDayController;
  FormDate({super.key, required this.payDayController});

  @override
  State<FormDate> createState() => _FormDateState();
}

class _FormDateState extends State<FormDate> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(
            'Vencimento: ${widget.payDayController.day} / ${widget.payDayController.month} / ${widget.payDayController.year}'),
        onPressed: () async {
          DateTime initalDate = DateTime.now();
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: initalDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickedDate == null) return;
          setState(() {
            widget.payDayController = pickedDate;
          });
        });
  }
}
