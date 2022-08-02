// Copyright 2022 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

part of 'data_model.dart';

@CopyWith()
@JsonSerializable()
class BillModel extends DataModel {
  const BillModel({
    required this.name,
    required this.records,
    this.remark,
  });

  factory BillModel.fromJson(Json json) => _$BillModelFromJson(json);

  final String name;
  @JsonKey(defaultValue: [])
  final List<RecordModel> records;
  final String? remark;

  @override
  Json toJson() => _$BillModelToJson(this);

  @override
  _$BillModelCWProxy get copyWith => _$BillModelCWProxyImpl(this);

  @override
  List<Object?> get props => <Object?>[name, records, remark];
}
