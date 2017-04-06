// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library fasta.io;

import 'dart:async' show Future;

import 'dart:io' show FileSystemException;

import 'errors.dart' show inputError;

import 'scanner/io.dart' as scanner_io show readBytesFromFile;

Future<List<int>> readBytesFromFile(Uri uri) async {
  try {
    return await scanner_io.readBytesFromFile(uri);
  } on FileSystemException catch (e) {
    String message = e.message;
    String osMessage = e.osError?.message;
    if (osMessage != null && osMessage.isNotEmpty) {
      message = osMessage;
    }
    return inputError(uri, -1, message);
  }
}
