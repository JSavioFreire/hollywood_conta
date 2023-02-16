import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MyProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Bill> listBill = [];
  List<Bill> listBillPayed = [];

  double totalAll = 0;
  double totalAllPayed = 0;

  double currentMonthAll = 0;
  double currentMonthAllPayed = 0;
  double porcentCurrentMonth = 0.0;

  double prevMonthAll = 0;
  double prevMonthAllPayed = 0;
  double porcentPrevMonth = 0.0;

  double nextMonthAll = 0;
  double nextMonthAllPayed = 0;
  double porcentNextMonth = 0.0;

  DateTime currentDate = DateTime.now();

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

  void toDb({billEdit}) {
    valueController.text = valueController.text.replaceAll(',', '.');

    Bill bill = Bill(
      id: const Uuid().v1(),
      name: nameController.text,
      company: companyController.text,
      payDay: payDayController.text,
      value: valueController.text,
      currentDate: currentDate.toString(),
    );
    if (billEdit != null) {
      bill.id = billEdit.id;
    }
    db.collection('contas').doc(bill.id).set(bill.toMap());
    refresh();
  }

  void toDbPayed(Bill bill) {
    Bill billPayed = Bill(
      id: const Uuid().v1(),
      name: bill.name,
      company: bill.company,
      payDay: bill.payDay,
      value: bill.value,
      currentDate: currentDate.toString(),
    );
    db.collection('pagas').doc(billPayed.id).set(billPayed.toMap());
    refreshPayed();
  }

  void refresh() async {
    List<Bill> temp = [];
    totalAll = 0;
    currentMonthAll = 0;
    prevMonthAll = 0;
    nextMonthAll = 0;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection('contas').orderBy('payDay').get();
    for (var doc in snapshot.docs) {
      temp.add(Bill.fromMap(doc.data()));
    }
    for (int i = 0; i < temp.length; i++) {
      totalAll += double.parse(temp[i].value);
      DateTime payDayDateTime = DateTime.parse(temp[i].payDay);

      if (payDayDateTime.month == currentDate.month) {
        currentMonthAll += double.parse(temp[i].value);
      }
      if (payDayDateTime.month == currentDate.month - 1) {
        prevMonthAll += double.parse(temp[i].value);
      }
      if (payDayDateTime.month == currentDate.month + 1) {
        nextMonthAll += double.parse(temp[i].value);
      }
    }

    listBill = temp;
    porcentCurrentMonth = toPorcent(currentMonthAll, currentMonthAllPayed);
    porcentPrevMonth = toPorcent(prevMonthAll, prevMonthAllPayed);
    porcentNextMonth = toPorcent(nextMonthAll, nextMonthAllPayed);
    notifyListeners();
  }

  void refreshPayed() async {
    List<Bill> tempPayed = [];
    totalAllPayed = 0;
    currentMonthAllPayed = 0;
    prevMonthAllPayed = 0;
    nextMonthAllPayed = 0;
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection('pagas')
        .orderBy('currentDate', descending: true)
        .get();
    for (var doc in snapshot.docs) {
      tempPayed.add(Bill.fromMap(doc.data()));
    }
    for (int i = 0; i < tempPayed.length; i++) {
      totalAllPayed += double.parse(tempPayed[i].value);
      DateTime payDayDateTime = DateTime.parse(tempPayed[i].payDay);

      if (payDayDateTime.month == currentDate.month) {
        currentMonthAllPayed += double.parse(tempPayed[i].value);
      }
      if (payDayDateTime.month == currentDate.month - 1) {
        prevMonthAllPayed += double.parse(tempPayed[i].value);
      }
      if (payDayDateTime.month == currentDate.month + 1) {
        nextMonthAllPayed += double.parse(tempPayed[i].value);
      }
    }

    listBillPayed = tempPayed;
    porcentCurrentMonth = toPorcent(currentMonthAll, currentMonthAllPayed);
    porcentPrevMonth = toPorcent(prevMonthAll, prevMonthAllPayed);
    porcentNextMonth = toPorcent(nextMonthAll, nextMonthAllPayed);

    notifyListeners();
  }

  double toPorcent(value, valuePayed) {
    double threeCurrent = valuePayed * 100 / (value + valuePayed);
    int toInt = threeCurrent.toInt();
    if (toInt == 100) {
      return 1;
    } else {
      var withZero = '0.$toInt';
      return double.parse(withZero);
    }
  }

  void delete(Bill bill) {
    db.collection('contas').doc(bill.id).delete();
    refresh();
  }

  void deletePayed(Bill bill) {
    db.collection('pagas').doc(bill.id).delete();
    refreshPayed();
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
