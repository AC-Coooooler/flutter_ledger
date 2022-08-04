// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

part of 'data_model.dart';

@CopyWith()
@JsonSerializable()
class RecordModel extends DataModel {
  const RecordModel({
    required this.name,
    required this.date,
    required this.expense,
    required this.amount,
    required this.people,
  });

  factory RecordModel.fromJson(Json json) => _$RecordModelFromJson(json);

  final String name;
  final DateTime date;
  final bool expense;
  @JsonKey(fromJson: Decimal.fromJson, toJson: _decimalToJson)
  final Decimal amount;
  @JsonKey(defaultValue: [])
  final List<PersonModel> people;

  static String _decimalToJson(Decimal value) => value.toJson();

  @override
  Json toJson() => _$RecordModelToJson(this);

  @override
  _$RecordModelCWProxy get copyWith => _$RecordModelCWProxyImpl(this);

  @override
  List<Object?> get props => <Object?>[name, date, expense, amount, people];
}
