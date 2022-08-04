// Copyright 2022 The AC-Coooooler author. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

extension DurationExtension on Duration {
  Future<void> get delay => Future<void>.delayed(this);
}
