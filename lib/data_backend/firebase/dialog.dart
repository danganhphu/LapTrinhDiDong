import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> showConfirmDialog(BuildContext context, String dispMesseges) async{
  AlertDialog dialog = AlertDialog(
    title: const Text("Xác nhận"),
    content: Text(dispMesseges),
    actions: [
      ElevatedButton(
          onPressed: () => Navigator.of(context,rootNavigator: true).pop("cancel"),
          child: Text("Hủy")),
      ElevatedButton(
          onPressed: () => Navigator.of(context,rootNavigator: true).pop("ok"),
          child: Text("Ok")),
    ],
  );
  String? res = await showDialog<String>(
    barrierDismissible: false,//phải bấm 1 trong 2 nút cancel hoặc ok
    context: context,
    builder:(context) => dialog,
  );
  return res;
}
void showSnackBar (BuildContext context,String message, int second)
{
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration:Duration(seconds:second),));

}