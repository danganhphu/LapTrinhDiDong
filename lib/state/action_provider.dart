import 'package:flutter/material.dart';

Future<String?> showDelete(
    BuildContext context, String dispMesseges) async {
  AlertDialog dialog = AlertDialog(
    title: const Text("Xác nhận"),
    content: Text(dispMesseges),
    actions: [
      ElevatedButton(
        onPressed: () =>
            Navigator.of(context, rootNavigator: true).pop("cancel"),
        child: const Text("Hủy"),
      ),
      ElevatedButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pop("ok"),
        child: const Text("OK"),
      ),
    ],
  );
  String? res = await showDialog<String?>(
      barrierDismissible: false,
      context: context,
      builder: (context) => dialog);
  return res;
}
Future<String?> showDeail(
    BuildContext context, String ten, String chuThich, String gia) async {
  AlertDialog detailDialog = AlertDialog(
    title: const Text("Chi tiết sản phẩm"),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Tên sản phẩm : $ten", style: const TextStyle(fontSize: 20)),
        Text("Mô tả : $chuThich", style: const TextStyle(fontSize: 20)),
        Text("Giá : $gia", style: const TextStyle(fontSize: 20))
      ],
    ),
    actions: [
      ElevatedButton(
        onPressed:() => Navigator.pop(context),
        child: const Text("Xác nhận", ),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
            primary: Colors.teal,
            textStyle: const TextStyle(fontSize: 24)
        ),
      ),
    ],
  );
  String? res = await showDialog<String?>(
      barrierDismissible: false,
      context: context,
      builder: (context) => detailDialog);
  return res;
}
