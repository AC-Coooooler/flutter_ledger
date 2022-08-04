// Copyright 2022 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'package:flutter/material.dart';
import 'package:ledger/exports.dart';

@FFRoute(name: 'bill-page')
class BillPage extends StatefulWidget {
  const BillPage({Key? key, required this.bill}) : super(key: key);

  final BillModel bill;

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  late List<PersonModel> people;

  @override
  void initState() {
    super.initState();
    _fillPeople();
  }

  @override
  void didUpdateWidget(BillPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.bill != oldWidget.bill) {
      _fillPeople();
      setState(() {});
    }
  }

  void _fillPeople() {
    people = widget.bill.records.fold<Set<PersonModel>>(
      <PersonModel>{},
      (p, e) => p..addAll(e.people),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.bill.name)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              child: ListTile(
                title: const Text('Participated people'),
                subtitle: SizedBox(
                  height: 42,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: people.length,
                    itemBuilder: (context, index) => Chip(
                      avatar: CircleAvatar(
                        child: Text(people[index].name.characters.first),
                      ),
                      label: Text(people[index].name),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 6),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final record = widget.bill.records[index];
                final isExpense = record.expense;
                return Card(
                  child: ListTile(
                    title: Text(record.name),
                    subtitle: Text(record.date.toIso8601String()),
                    trailing: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: isExpense ? '-' : '+'),
                          TextSpan(text: record.amount.toString()),
                        ],
                      ),
                      style: TextStyle(
                        color: isExpense ? Colors.redAccent : Colors.lightGreen,
                      ),
                    ),
                  ),
                );
              },
              childCount: widget.bill.records.length,
            ),
          ),
        ],
      ),
    );
  }
}
