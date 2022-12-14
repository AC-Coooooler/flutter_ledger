// GENERATED CODE - DO NOT MODIFY MANUALLY
// **************************************************************************
// Auto generated by https://github.com/fluttercandies/ff_annotation_route
// **************************************************************************
// ignore_for_file: prefer_const_literals_to_create_immutables,unused_local_variable,unused_import,unnecessary_import
import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:flutter/widgets.dart';
import 'package:ledger/exports.dart';

import '../pages/bill.dart';
import '../pages/home.dart';
import '../pages/splash.dart';

FFRouteSettings getRouteSettings({
  required String name,
  Map<String, dynamic>? arguments,
  PageBuilder? notFoundPageBuilder,
}) {
  final Map<String, dynamic> safeArguments =
      arguments ?? const <String, dynamic>{};
  switch (name) {
    case 'bill-adding-page':
      return FFRouteSettings(
        name: name,
        arguments: arguments,
        builder: () => BillAddingPage(
          key: asT<Key?>(
            safeArguments['key'],
          ),
        ),
      );
    case 'bill-page':
      return FFRouteSettings(
        name: name,
        arguments: arguments,
        builder: () => BillPage(
          key: asT<Key?>(
            safeArguments['key'],
          ),
          bill: asT<BillModel>(
            safeArguments['bill'],
          )!,
        ),
      );
    case 'home-page':
      return FFRouteSettings(
        name: name,
        arguments: arguments,
        builder: () => HomePage(
          key: asT<Key?>(
            safeArguments['key'],
          ),
        ),
      );
    case 'splash-page':
      return FFRouteSettings(
        name: name,
        arguments: arguments,
        builder: () => SplashPage(
          key: asT<Key?>(
            safeArguments['key'],
          ),
        ),
      );
    default:
      return FFRouteSettings(
        name: FFRoute.notFoundName,
        routeName: FFRoute.notFoundRouteName,
        builder: notFoundPageBuilder ?? () => Container(),
      );
  }
}
