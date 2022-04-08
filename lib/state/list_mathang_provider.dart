import 'package:flutter/foundation.dart';

class SanPham {
  late String ten;
  late String chuThich;
  late double gia;

  SanPham({required this.ten, required this.chuThich, required this.gia});
}

class QuanLySanPham extends ChangeNotifier {
  final List<SanPham> _list = [
    SanPham(
        ten: "Nho",
        chuThich: "Nho Ninh Thuận loại 1",
        gia: 10000),
    SanPham(
        ten: "Táo",
        chuThich: "Táo mật Koru Mỹ",
        gia: 20000),
    SanPham(
        ten: "Quýt Úc",
        chuThich: "Vị ngọt, không hạt",
        gia: 30000),
    SanPham(
        ten: "Táo đỏ Red Dilicious Mỹ",
        chuThich: "Màu đỏ đậm đẹp mắt, thịt trắng ngà",
        gia: 40000),
    SanPham(
        ten: "Lê Nam Phi",
        chuThich: "Vị ngọt thanh, rất giòn và thơm",
        gia: 50000),
    SanPham(
        ten: "Bưởi 5 roi",
        chuThich: "Tép thịt căng, ngọt, không chua",
        gia: 60000),
    SanPham(
        ten: "Bưởi 5 roi",
        chuThich: "Tép thịt căng, ngọt, không chua",
        gia: 60000),
  ];
  List<SanPham> get list => _list;

  void delete(SanPham sp) {
    _list.remove(sp);
    notifyListeners();
  }

  void add(SanPham sp) {
    _list.add(sp);
    notifyListeners();
  }

  void update(SanPham moi, SanPham cu) {
    notifyListeners();
  }
}
