// Copyright 2022 The AC-Coooooler author. All rights reserved.
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
              (context, index) => _RecordCard(widget.bill.records[index]),
              childCount: widget.bill.records.length,
            ),
          ),
        ],
      ),
    );
  }
}

@FFRoute(name: 'bill-adding-page')
class BillAddingPage extends StatefulWidget {
  const BillAddingPage({Key? key}) : super(key: key);

  @override
  State<BillAddingPage> createState() => _BillAddingPageState();
}

class _BillAddingPageState extends State<BillAddingPage> {
  final TextEditingController _nameTEC = TextEditingController();
  List<RecordModel> _records = [];

  void _saveBill() {
    if (_nameTEC.text.isEmpty) {
      return;
    }
    final bill = BillModel(
      name: _nameTEC.text,
      records: _records.toList(),
    );
    LogUtil.d(bill);
    Boxes.contentBox.add(bill.toNoIntentString());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adding bill')),
      body: ListView(
        children: [
          TextField(
            controller: _nameTEC,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              hintText: "Enter your bill's name",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 24),
            maxLength: 20,
            buildCounter: buildEmptyCounter,
          ),
          const Divider(height: 1),
          ..._records.map(_RecordCard.new),
          _AddNewRecordCard(
            onNewRecord: (model) => setState(
              () => _records = [..._records, model],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveBill,
        tooltip: 'Save the bill',
        child: const Icon(Icons.save_rounded),
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  const _RecordCard(this.record, {Key? key}) : super(key: key);

  final RecordModel record;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(record.name),
        subtitle: Text(record.date.toIso8601String()),
        trailing: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: record.expense ? '-' : '+'),
              TextSpan(text: record.amount.toString()),
            ],
          ),
          style: TextStyle(
            color: record.expense ? recordColorExpense : recordColorIncome,
          ),
        ),
      ),
    );
  }
}

class _AddNewRecordCard extends StatefulWidget {
  const _AddNewRecordCard({
    Key? key,
    required this.onNewRecord,
  }) : super(key: key);

  final void Function(RecordModel record) onNewRecord;

  @override
  State<_AddNewRecordCard> createState() => _AddNewRecordCardState();
}

class _AddNewRecordCardState extends State<_AddNewRecordCard> {
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _amountTEC = TextEditingController();
  final ValueNotifier<bool> _isExpense = ValueNotifier<bool>(true);
  final ValueNotifier<DateTime> _dateNotifier =
      ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<TimeOfDay?> _timeNotifier =
      ValueNotifier<TimeOfDay?>(null);
  final ValueNotifier<List<PersonModel>> _peopleNotifier =
      ValueNotifier<List<PersonModel>>([]);

  void _verifyNewRecord() {
    if (_nameTEC.text.isEmpty ||
        _amountTEC.text.isEmpty ||
        _peopleNotifier.value.isEmpty ||
        Decimal.tryParse(_amountTEC.text) == null) {
      LogUtil.w('Missing fields for record.');
      return;
    }
    final record = RecordModel(
      name: _nameTEC.text,
      date: _dateNotifier.value,
      expense: _isExpense.value,
      amount: Decimal.parse(_amountTEC.text),
      people: _peopleNotifier.value.toList(),
    );
    LogUtil.d(record);
    widget.onNewRecord(record);
  }

  Widget _buildNameField(BuildContext context) {
    return TextField(
      controller: _nameTEC,
      decoration: const InputDecoration(
        hintText: 'Enter record name',
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      style: context.textTheme.headline5,
    );
  }

  Widget _buildExpenseSwitch(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isExpense,
      builder: (_, bool value, __) => Row(
        children: [
          const Text('Select expense type:'),
          const Spacer(),
          Text(
            value ? 'Expense' : 'Income',
            style: TextStyle(
              color: value ? recordColorExpense : recordColorIncome,
            ),
            textAlign: TextAlign.end,
          ),
          Switch(
            onChanged: (bool? v) => _isExpense.value = v ?? _isExpense.value,
            value: value,
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Row(
      children: [
        const Text('Choose record date:'),
        const Spacer(),
        ValueListenableBuilder<TimeOfDay?>(
          valueListenable: _timeNotifier,
          builder: (_, TimeOfDay? value, __) {
            if (value == null) {
              return TextButton(
                onPressed: () => showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((t) => _timeNotifier.value = t ?? _timeNotifier.value),
                child: const Text('More specific'),
              );
            }
            return ElevatedButton(
              onPressed: () => showTimePicker(
                context: context,
                initialTime: value,
              ).then((t) => _timeNotifier.value = t ?? _timeNotifier.value),
              onLongPress: () => _timeNotifier.value = null,
              child: Text(value.format(context)),
            );
          },
        ),
        const Gap.h(4),
        ValueListenableBuilder<DateTime>(
          valueListenable: _dateNotifier,
          builder: (_, DateTime value, __) => ElevatedButton(
            onPressed: () => showDatePicker(
              context: context,
              initialDate: value,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
            ).then((d) => _dateNotifier.value = d ?? _dateNotifier.value),
            onLongPress: () => _dateNotifier.value = DateTime.now(),
            child: Text(DateFormat('yyyy-MM-dd').format(value)),
          ),
        )
      ],
    );
  }

  Widget _buildAmountField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Input record amount:'),
        IntrinsicWidth(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 30),
            child: TextField(
              controller: _amountTEC,
              decoration: const InputDecoration(hintText: '0.0'),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.end,
              maxLength: 8,
              inputFormatters: [moneyFormatter],
              buildCounter: buildEmptyCounter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPeople(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Choose people:'),
        Expanded(
          child: ValueListenableBuilder<List<PersonModel>>(
            valueListenable: _peopleNotifier,
            builder: (BuildContext c, List<PersonModel> value, __) => Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                ...value.map(
                  (e) => Chip(
                    label: Text(e.name),
                    onDeleted: () => _peopleNotifier.value = [
                      ..._peopleNotifier.value..remove(e),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => showModalBottomSheet(
                    context: c,
                    builder: (_) => const _AddPersonSheet(),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                  ).then(
                    (n) {
                      if (n != null) {
                        _peopleNotifier.value = [
                          ..._peopleNotifier.value,
                          PersonModel(name: n),
                        ];
                      }
                    },
                  ),
                  child: const Text('Add person'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        borderRadius: RadiusConstants.r4,
        color: context.theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: _buildNameField(context)),
                  IconButton(
                    onPressed: _verifyNewRecord,
                    icon: const Icon(Icons.check_rounded),
                  ),
                ],
              ),
              _buildExpenseSwitch(context),
              _buildDateField(context),
              _buildAmountField(context),
              _buildPeople(context),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddPersonSheet extends StatefulWidget {
  const _AddPersonSheet({Key? key}) : super(key: key);

  @override
  State<_AddPersonSheet> createState() => _AddPersonSheetState();
}

class _AddPersonSheetState extends State<_AddPersonSheet> {
  final TextEditingController _tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter person's name", style: context.textTheme.headline5),
          TextField(
            controller: _tec,
            autofocus: true,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              if (_tec.text.isNotEmpty) {
                Navigator.of(context).pop(_tec.text);
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
