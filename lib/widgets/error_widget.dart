// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../utils/log_util.dart';

class LedgerErrorWidget extends StatelessWidget {
  const LedgerErrorWidget._(this.details, {Key? key}) : super(key: key);

  final FlutterErrorDetails details;

  static void takeOver() {
    ErrorWidget.builder = (FlutterErrorDetails d) {
      LogUtil.e(
        'Error has been delivered to the ErrorWidget: ${d.exception}',
        stackTrace: d.stack,
      );
      return LedgerErrorWidget._(d);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Color.lerp(
            Theme.of(context).canvasColor,
            themeColorLight,
            0.1,
          ),
        ),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Exception thrown during building this widget...',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                details.exception.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                details.stack.toString(),
                style: const TextStyle(fontSize: 13),
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
