import 'package:flutter/material.dart';
import 'package:hollywood_conta/model/bill_model.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class MyDismissible extends StatelessWidget {
  final Bill bill;
  final Widget inside;

  const MyDismissible({super.key, required this.bill, required this.inside});

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);

    return Dismissible(
      key: ValueKey<Bill>(bill),
      background: Container(
        color: ThemeColors.myGreen,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 15),
        child: const Icon(
          Icons.moving_outlined,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: ThemeColors.myRed,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 15),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text(
                      'Você tem certeza?',
                      style: TextStyle(color: ThemeColors.myBlack),
                    ),
                    content: const Text(
                      'Você deseja mesmo deletar essa conta?',
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  ));
        } else {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text(
                      'Você tem certeza?',
                      style: TextStyle(color: ThemeColors.myBlack),
                    ),
                    content: const Text(
                      'Você deseja mesmo deletar essa conta?',
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  ));
        }
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          provider.delete(bill);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Conta excluída!')));
        } else {
          provider.delete(bill);
          provider.toDbPayed(bill);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Conta salva como paga!')));
        }
      },
      child: inside,
    );
  }
}
