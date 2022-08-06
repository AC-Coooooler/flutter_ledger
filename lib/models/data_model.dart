// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import '../utils/log_util.dart';

part 'data_model.d.dart';

part 'data_model.g.dart';

// Belows are models part.
part 'bill_model.dart';

part 'person_model.dart';

part 'record_model.dart';

typedef Json = Map<String, dynamic>;
typedef JsonList = List<Json>;
typedef QueryMap = Map<String, String>;

abstract class DataModel extends Equatable {
  const DataModel();

  Json toJson();

  dynamic get copyWith;

  /// Avoid intent from the json encoder.
  String toNoIntentString() => globalJsonEncoderWithoutIntent.convert(toJson());

  @override
  String toString() => globalJsonEncoder.convert(toJson());
}

typedef DataFactory<T extends DataModel> = T Function(Json json);

T makeModel<T extends DataModel>(Json json) {
  if (!dataModelFactories.containsKey(T)) {
    LogUtil.e(
      "You're inflating an unregistered type: $T\n"
      "Please check if it's registered in `dataModelFactories`.",
      tag: '🏭 DataModel',
    );
    throw ModelNotRegisteredError<T>();
  }
  try {
    return dataModelFactories[T]!(json) as T;
  } catch (e, s) {
    LogUtil.e(
      'Error when making model with $T type: $e\n'
      '${json.containsKey('id') ? 'Model contains id: ${json['id']}\n' : ''}'
      'The raw data which make this error is: '
      '${globalJsonEncoder.convert(json)}',
      stackTrace: s,
      tag: '🏭 DataModel',
    );
    throw ModelMakeError<T>(json, e);
  }
}

class EmptyDataModel extends DataModel {
  const EmptyDataModel();

  factory EmptyDataModel.fromJson(dynamic _) => const EmptyDataModel();

  @override
  Json toJson() => const <String, dynamic>{};

  @override
  EmptyDataModel get copyWith => this;

  @override
  List<Object?> get props => <Object?>[null];
}

class ModelError extends TypeError {}

class ModelMakeError<T extends DataModel> extends ModelError {
  ModelMakeError(this.json, this.error);

  final Json json;
  final Object error;
}

class ModelNotRegisteredError<T extends DataModel> extends ModelError {
  ModelNotRegisteredError();

  @override
  String toString() {
    return "You're inflating an unregistered type: $T\n"
        "Please check if it's registered in `dataModelFactories`.";
  }
}
