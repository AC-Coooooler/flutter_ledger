// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

part of 'data_model.dart';

@CopyWith()
@JsonSerializable()
class PersonModel extends DataModel {
  const PersonModel({required this.name});

  factory PersonModel.fromJson(Json json) => _$PersonModelFromJson(json);

  final String name;

  @override
  Json toJson() => _$PersonModelToJson(this);

  @override
  _$PersonModelCWProxy get copyWith => _$PersonModelCWProxyImpl(this);

  @override
  List<Object?> get props => <Object>[name];
}
