// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
@FFArgumentImport()
import 'package:ledger/exports.dart';

@FFRoute(name: 'home-page')
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueListenable<Box<String>> _boxListenable =
      Boxes.contentBox.listenable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ledger')),
      body: ValueListenableBuilder<Box<String>>(
        valueListenable: _boxListenable,
        builder: (_, Box<String> box, __) {
          final bills =
              box.values.map((e) => BillModel.fromJson(jsonDecode(e))).toList();
          if (bills.isEmpty) {
            return Center(
              child: Text(
                'No bills yet.\n'
                'Press the button to add one.',
                style: Theme.of(context).textTheme.headline6,
              ),
            );
          }
          return ListView.builder(
            itemCount: bills.length,
            itemBuilder: (context, index) => _BillCard(
              key: ValueKey(bills[index].name),
              bill: bills[index],
              boxIndex: index,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          Routes.billAddingPage.name,
        ),
        tooltip: 'Add new bill',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _BillCard extends StatelessWidget {
  const _BillCard({
    Key? key,
    required this.bill,
    required this.boxIndex,
  }) : super(key: key);

  final BillModel bill;
  final int boxIndex;

  Widget _buildSlidable({
    required BuildContext context,
    required Widget child,
  }) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => Boxes.contentBox.deleteAt(boxIndex),
            backgroundColor: recordColorExpense,
            borderRadius: RadiusConstants.r4,
            label: 'Delete',
            icon: Icons.delete,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        leading: SizedBox.fromSize(
          size: const Size.square(36),
          child: CircleAvatar(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(bill.name.characters.first),
            ),
          ),
        ),
        title: Text(
          bill.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          bill.startDate?.toIso8601String() ?? 'No records',
        ),
        trailing: Text('${bill.records.length} records'),
        onTap: () => Navigator.of(context).pushNamed(
          Routes.billPage.name,
          arguments: Routes.billPage.d(bill: bill),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: _buildSlidable(context: context, child: _buildCard(context)),
    );
  }
}
