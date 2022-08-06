// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'dart:convert';

import 'package:flutter/services.dart';

const JsonEncoder globalJsonEncoder = JsonEncoder.withIndent('  ');
const JsonEncoder globalJsonEncoderWithoutIntent = JsonEncoder();

const String urlScheme = r'http(s?)://';
final RegExp urlRegExp = RegExp(urlScheme);

/// Allows 5 digits for the integer, and 2 digits for after the decimal.
///
/// Examples:
/// - 10000.01
/// - 0.01
const String moneyRawString = r'^(0|[1-9][0-9]{0,4})(\.\d{0,2})?$';
final RegExp moneyRegExp = RegExp(moneyRawString);
final TextInputFormatter moneyFormatter = TextInputFormatter.withFunction(
  (o, n) => (n.text.isEmpty || moneyRegExp.hasMatch(n.text)) ? n : o,
);
