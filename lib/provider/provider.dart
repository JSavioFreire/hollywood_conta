import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';

class MyProvider extends ChangeNotifier {
  List<Bill> listBill = [];

  refresh() {
    listBill.add(Bill(id: 'teste', name: 'teste'));

    notifyListeners();
  }
}
