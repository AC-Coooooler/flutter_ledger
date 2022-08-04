// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'package:flutter/painting.dart';
import 'package:oktoast/oktoast.dart' as ok;

const Color _failedColor = Color(0xffff6363);

void showToast(String text, {Duration? duration}) {
  ok.showToast(text, duration: duration);
}

void showCenterToast(String text) {
  ok.showToast(
    text,
    position: ok.ToastPosition.center,
  );
}

void showErrorToast(String text) {
  ok.showToast(
    text,
    backgroundColor: _failedColor,
  );
}

void showCenterErrorToast(String text) {
  ok.showToast(
    text,
    position: ok.ToastPosition.center,
    backgroundColor: _failedColor,
  );
}

void showTopToast(String text) {
  ok.showToast(
    text,
    position: ok.ToastPosition.top,
  );
}

void showToastWithPosition(String text, {ok.ToastPosition? position}) {
  ok.showToast(
    text,
    position: position,
  );
}

void showErrorToastWithPosition(String text, {ok.ToastPosition? position}) {
  ok.showToast(
    text,
    position: position,
  );
}

void dismissAllToast({bool showAnim = false}) {
  ok.dismissAllToast(showAnim: showAnim);
}
