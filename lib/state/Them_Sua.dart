
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_mathang_provider.dart';

class ThemSuaPage extends StatefulWidget {
  SanPham? sp;
  ThemSuaPage({Key? key, this.sp}) : super(key: key);

  @override
  State<ThemSuaPage> createState() => _ThemSuaPageState();
}

class _ThemSuaPageState extends State<ThemSuaPage> {
  SanPham? spCu, spMoi;
  String labelButton = "thêm";
  bool them = true;

  TextEditingController txtTen = TextEditingController();

  TextEditingController txtchuThich = TextEditingController();

  TextEditingController txtGia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('chỉnh sửa chi tiết sp'),
          centerTitle: true,
        ),
        body: Column(
            children:[
              TextFormField(
                  controller: txtTen,
                  decoration: const InputDecoration(
                      labelText: "Tên trái cây"
                  )
              ),
              TextFormField(
                  controller: txtchuThich,
                  decoration: const InputDecoration(
                      labelText: "Mô tả"
                  )
              ),
              TextFormField(
                  controller: txtGia,
                  decoration: const InputDecoration(
                      labelText: "Giá"
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed:() {
                        themMoi();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text('Thêm sản phẩm ${txtTen.text} thành công'),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Text(labelButton)
                  )
                ],
              )
            ],
          ),
    );
  }

  void themMoi() {
    Provider.of<QuanLySanPham>(context, listen: false).add(
        SanPham(
            ten: txtTen.text,
            chuThich: txtchuThich.text,
            gia: double.parse(txtGia.text)
        )
    );
    }

  void capNhat(){
    Provider.of<QuanLySanPham>(context, listen: false)
        .update(
        spMoi!,
        SanPham(
            ten: txtTen.text,
            chuThich: txtchuThich.text,
            gia: double.parse(txtGia.text)
        )
    );
  }

  kiemTraChuoi(String? value) {
    return value == null || value.isEmpty ? "Bạn chưa nhập dữ liệu" : null;
  }

  kiemTraGia(String? value) {
    if(value == null|| value.isEmpty) {
      return "Bạn chưa nhập giá";
    } else {
      return double.parse(value) < 0 ? "Giá không được phép bé hơn 0" : null;
    }
  }
}