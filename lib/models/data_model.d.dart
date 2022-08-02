part of 'data_model.dart';

final Map<Type, DataFactory> dataModelFactories = <Type, DataFactory>{
  EmptyDataModel: EmptyDataModel.fromJson,
  BillModel: BillModel.fromJson,
  RecordModel: RecordModel.fromJson,
  PersonModel: PersonModel.fromJson,
};
