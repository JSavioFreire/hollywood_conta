import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MyProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Bill> listBill = [];
  List<Bill> listBillPayed = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController payDayController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  void resetController() {
    nameController.text = '';
    companyController.text = '';
    payDayController.text = '';
    valueController.text = '';
  }

  toDb() {
    Bill bill = Bill(
      id: const Uuid().v1(),
      name: nameController.text,
      company: companyController.text,
      payDay: payDayController.text,
      value: valueController.text,
    );
    db.collection('contas').doc(bill.id).set(bill.toMap());
    refresh();
  }

  toDbPayed(bill) {
    Bill billPayed = Bill(
      id: const Uuid().v1(),
      name: bill.name,
      company: bill.company,
      payDay: bill.payDay,
      value: bill.value,
    );
    db.collection('pagas').doc(billPayed.id).set(billPayed.toMap());
    refreshPayed();
  }

  refresh() async {
    List<Bill> temp = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('contas').get();
    for (var doc in snapshot.docs) {
      temp.add(Bill.fromMap(doc.data()));
    }
    listBill = temp;
    notifyListeners();
  }

  refreshPayed() async {
    List<Bill> tempPayed = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('pagas').get();
    for (var doc in snapshot.docs) {
      tempPayed.add(Bill.fromMap(doc.data()));
    }
    listBillPayed = tempPayed;
    notifyListeners();
  }

  delete(Bill bill) {
    db.collection('contas').doc(bill.id).delete();
    refresh();
  }

  PageController controllerPageView = PageController(
    initialPage: 0,
  );

  void changePageButton(element) {
    controllerPageView.animateToPage(
      element,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }
}
