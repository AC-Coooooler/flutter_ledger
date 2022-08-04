// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

import 'dart:convert';

const JsonEncoder globalJsonEncoder = JsonEncoder.withIndent('  ');

const String urlScheme = r'http(s?)://';
final RegExp urlRegExp = RegExp(urlScheme);
