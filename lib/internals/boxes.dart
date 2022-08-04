// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'package:hive/hive.dart';

import '../extensions/future_extension.dart';
import '../utils/log_util.dart';

class Boxes {
  const Boxes._();

  static late Box<String> settingBox;
  static late Box<String> contentBox;

  static Future<void> openBoxes() async {
    LogUtil.d('Opening boxes...', tag: '💾 Hive');
    final Stopwatch stopwatch = Stopwatch()..start();
    await Future.wait(
      <Future<void>>[
        Hive.openBox<String>(
          'user:setting',
        ).then((Box<String> box) => settingBox = box),
        Hive.openBox<String>(
          'user:content',
        ).then((Box<String> box) => contentBox = box),
      ],
    );
    stopwatch
      ..stop()
      ..logElapsed('Hive boxes open');
  }
}
