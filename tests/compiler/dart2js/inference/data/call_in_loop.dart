// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Regression test for [ClosureCallSiteTypeInformation] in loops.

/*element: Class.:[exact=Class]*/
class Class<T> {
  /*element: Class.method:[null]*/
  method() {
    /*iterator: Container([exact=JSExtendableArray], element: [empty], length: 0)*/
    /*current: [exact=ArrayIterator]*/
    /*moveNext: [exact=ArrayIterator]*/
    for (var a in []) {
      (T as dynamic) /*invoke: [exact=TypeImpl]*/ (a);
      (Object as dynamic) /*invoke: [exact=TypeImpl]*/ ();
      (this as dynamic) /*invoke: [exact=Class]*/ ();
      (1 as dynamic) /*invoke: [exact=JSUInt31]*/ ();
    }
  }
}

/*element: main:[null]*/
main() {
  new Class(). /*invoke: [exact=Class]*/ method();
}
