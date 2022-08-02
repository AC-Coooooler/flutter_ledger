// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BillModelCWProxy {
  BillModel name(String name);

  BillModel records(List<RecordModel> records);

  BillModel remark(String? remark);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BillModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BillModel(...).copyWith(id: 12, name: "My name")
  /// ````
  BillModel call({
    String? name,
    List<RecordModel>? records,
    String? remark,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBillModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBillModel.copyWith.fieldName(...)`
class _$BillModelCWProxyImpl implements _$BillModelCWProxy {
  final BillModel _value;

  const _$BillModelCWProxyImpl(this._value);

  @override
  BillModel name(String name) => this(name: name);

  @override
  BillModel records(List<RecordModel> records) => this(records: records);

  @override
  BillModel remark(String? remark) => this(remark: remark);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BillModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BillModel(...).copyWith(id: 12, name: "My name")
  /// ````
  BillModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? records = const $CopyWithPlaceholder(),
    Object? remark = const $CopyWithPlaceholder(),
  }) {
    return BillModel(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      records: records == const $CopyWithPlaceholder() || records == null
          ? _value.records
          // ignore: cast_nullable_to_non_nullable
          : records as List<RecordModel>,
      remark: remark == const $CopyWithPlaceholder()
          ? _value.remark
          // ignore: cast_nullable_to_non_nullable
          : remark as String?,
    );
  }
}

extension $BillModelCopyWith on BillModel {
  /// Returns a callable class that can be used as follows: `instanceOfBillModel.copyWith(...)` or like so:`instanceOfBillModel.copyWith.fieldName(...)`.
  _$BillModelCWProxy get copyWith => _$BillModelCWProxyImpl(this);
}

abstract class _$PersonModelCWProxy {
  PersonModel name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonModel call({
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPersonModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPersonModel.copyWith.fieldName(...)`
class _$PersonModelCWProxyImpl implements _$PersonModelCWProxy {
  final PersonModel _value;

  const _$PersonModelCWProxyImpl(this._value);

  @override
  PersonModel name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonModel call({
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return PersonModel(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $PersonModelCopyWith on PersonModel {
  /// Returns a callable class that can be used as follows: `instanceOfPersonModel.copyWith(...)` or like so:`instanceOfPersonModel.copyWith.fieldName(...)`.
  _$PersonModelCWProxy get copyWith => _$PersonModelCWProxyImpl(this);
}

abstract class _$RecordModelCWProxy {
  RecordModel amount(Decimal amount);

  RecordModel date(DateTime date);

  RecordModel name(String name);

  RecordModel people(List<PersonModel> people);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecordModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecordModel(...).copyWith(id: 12, name: "My name")
  /// ````
  RecordModel call({
    Decimal? amount,
    DateTime? date,
    String? name,
    List<PersonModel>? people,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRecordModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRecordModel.copyWith.fieldName(...)`
class _$RecordModelCWProxyImpl implements _$RecordModelCWProxy {
  final RecordModel _value;

  const _$RecordModelCWProxyImpl(this._value);

  @override
  RecordModel amount(Decimal amount) => this(amount: amount);

  @override
  RecordModel date(DateTime date) => this(date: date);

  @override
  RecordModel name(String name) => this(name: name);

  @override
  RecordModel people(List<PersonModel> people) => this(people: people);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecordModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecordModel(...).copyWith(id: 12, name: "My name")
  /// ````
  RecordModel call({
    Object? amount = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? people = const $CopyWithPlaceholder(),
  }) {
    return RecordModel(
      amount: amount == const $CopyWithPlaceholder() || amount == null
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as Decimal,
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      people: people == const $CopyWithPlaceholder() || people == null
          ? _value.people
          // ignore: cast_nullable_to_non_nullable
          : people as List<PersonModel>,
    );
  }
}

extension $RecordModelCopyWith on RecordModel {
  /// Returns a callable class that can be used as follows: `instanceOfRecordModel.copyWith(...)` or like so:`instanceOfRecordModel.copyWith.fieldName(...)`.
  _$RecordModelCWProxy get copyWith => _$RecordModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map<String, dynamic> json) => BillModel(
      name: json['name'] as String,
      records: (json['records'] as List<dynamic>?)
              ?.map((e) => RecordModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$BillModelToJson(BillModel instance) => <String, dynamic>{
      'name': instance.name,
      'records': instance.records.map((e) => e.toJson()).toList(),
      'remark': instance.remark,
    };

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      name: json['name'] as String,
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) => RecordModel(
      name: json['name'] as String,
      date: RecordModel._dateTimeFromJson(json['date'] as String),
      amount: RecordModel._decimalTimeFromJson(json['amount'] as String),
      people: (json['people'] as List<dynamic>?)
              ?.map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RecordModelToJson(RecordModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': RecordModel._dateTimeToJson(instance.date),
      'amount': RecordModel._decimalToJson(instance.amount),
      'people': instance.people.map((e) => e.toJson()).toList(),
    };
