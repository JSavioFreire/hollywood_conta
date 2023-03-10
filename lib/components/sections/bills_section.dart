import 'package:flutter/material.dart';
import 'package:hollywood_conta/components/widgets/list_tile/my_list_tile.dart';
import 'package:hollywood_conta/components/widgets/list_tile/my_list_tile_payed.dart';
import 'package:hollywood_conta/provider/provider.dart';
import 'package:provider/provider.dart';

class BillSection extends StatelessWidget {
  const BillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.only(top: 310),
        child: PageView(
            controller: value.controllerPageView,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  value.refresh();
                  value.refreshPayed();
                },
                child: ListView.builder(
                    itemCount: value.listBill.length,
                    itemBuilder: (context, index) =>
                        MyListTile(bill: value.listBill[index])),
              ),
              ListView.builder(
                itemCount: value.listBillPayed.length,
                itemBuilder: (context, index) =>
                    MyListTilePayed(bill: value.listBillPayed[index]),
              ),
            ]),
      ),
    );
  }
}
