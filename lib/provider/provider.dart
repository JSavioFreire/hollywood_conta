import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MyProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Bill> listBill = [];
  TextEditingController nameController = TextEditingController();

  showModal(context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => Column(
              children: [
                TextFormField(
                  controller: nameController,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancelar')),
                    ElevatedButton(
                        onPressed: () {
                          toDb();
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar'))
                  ],
                )
              ],
            ));
  }

  toDb() {
    Bill bill = Bill(id: const Uuid().v1(), name: nameController.text);
    db.collection('contas').doc(bill.id).set(bill.toMap());
    refresh();
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
