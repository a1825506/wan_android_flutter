// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class ToastUtils{
//   static void show(String? text) {
//     Fluttertoast.cancel();
//     Fluttertoast.showToast(
//       msg: text.toString(),
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.white,
//       textColor: Colors.black,
//       fontSize: 16.0
//     );
//   }
// }
//
// void toast(Object? obj) {
//   Fluttertoast.cancel();
//   Fluttertoast.showToast(
//       msg: "{$obj}",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.white,
//       textColor: Colors.black,
//       fontSize: 16.0
//   );
// }
//
// extension ToastExtensions on Object? {
//   void toast() {
//     Fluttertoast.cancel();
//     Fluttertoast.showToast(
//         msg: "${this}",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         // backgroundColor: Colors.grey[600],
//         // textColor: Colors.white,
//         backgroundColor: Colors.white,
//         textColor: Colors.black,
//         fontSize: 16.0);
//   }
// }