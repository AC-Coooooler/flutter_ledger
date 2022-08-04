// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'package:flutter/material.dart';
@FFArgumentImport()
import 'package:ledger/exports.dart';

@FFRoute(name: 'home-page')
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final bills = <BillModel>[
    BillModel(
      name: 'Test bill',
      records: [
        RecordModel(
          name: 'Test record',
          date: DateTime(2022, 8, 3),
          expense: true,
          amount: Decimal.parse('367.5'),
          people: const [PersonModel(name: 'Alex')],
        ),
      ],
    ),
  ];

  // int _currentIndex = 0;

  // void _selectIndex(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  Widget _buildBody(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      // removeBottom: true,
      child: LazyIndexedStack(
        // index: _currentIndex,
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('Ledger'),
            ),
            body: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                final bill = bills[index];
                return Card(
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
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Add new bill',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNavigationBar(BuildContext context) {
  //   return BottomNavigationBar(
  //     currentIndex: _currentIndex,
  //     onTap: _selectIndex,
  //     items: <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: const Icon(Icons.home_outlined),
  //         activeIcon: const Icon(Icons.home),
  //         label: context.l10n.navHome,
  //       ),
  //       BottomNavigationBarItem(
  //         icon: const Icon(Icons.local_fire_department_outlined),
  //         activeIcon: const Icon(Icons.local_fire_department),
  //         label: context.l10n.navPins,
  //       ),
  //       BottomNavigationBarItem(
  //         icon: const Icon(Icons.manage_accounts_outlined),
  //         activeIcon: const Icon(Icons.manage_accounts),
  //         label: context.l10n.navMe,
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: _buildBody(context)),
          // _buildBottomNavigationBar(context),
        ],
      ),
    );
  }
}
