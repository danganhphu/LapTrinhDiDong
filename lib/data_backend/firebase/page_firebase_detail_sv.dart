import 'dart:io';

import 'dialog.dart';
import 'firebase_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageSVDetail extends StatefulWidget {
  SinhVienSnapshot? sinhVienSnapshot;
  bool? xem;
  PageSVDetail({Key? key, this.sinhVienSnapshot, required this.xem}) : super(key: key);

  @override
  State<PageSVDetail> createState() => _PageSVDetailState();
}

class _PageSVDetailState extends State<PageSVDetail> {
  bool _imgageChange = false;
  XFile? _xImage;
  SinhVienSnapshot? svs;
  bool? xem;
  String buttonLabel = "Thêm";
  String title ="Thêm sinh viên mới";
  TextEditingController txtId = TextEditingController();
  TextEditingController txtten = TextEditingController();
  TextEditingController txtlop = TextEditingController();
  TextEditingController txtquequan = TextEditingController();
  TextEditingController txtnamsinh = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: _imgageChange ? Image.file(File(_xImage!.path),):
                  svs?.sinhVien!.anh !=null ? Image.network(svs!.sinhVien!.anh!):null,
                    ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 20,),
                      ElevatedButton(
                          onPressed: xem!=true ? () => _chonAnh(context):null,
                          child: const Icon(Icons.image)),
                    ],
                  ),
                  TextField(
                    controller: txtId,
                    decoration: InputDecoration(
                      label: Text("ID"),
                    ),
                    keyboardType: TextInputType.text,
                  ),
              TextField(
                controller: txtten,
                decoration: InputDecoration(
                  label: Text("Tên"),
                ),
                keyboardType: TextInputType.text,
              ),
                  TextField(
                    controller: txtlop,
                    decoration: InputDecoration(
                      label: Text("Lớp"),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    controller: txtquequan,
                    decoration: InputDecoration(
                      label: Text("Quê quán"),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    controller: txtnamsinh,
                    decoration: InputDecoration(
                      label: Text("Năm sinh"),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () async{
                            if (xem==true)
                              Navigator.pop(context);
                            else
                              {
                                _capnhat(context);
                              }
                          },
                          child: Text(buttonLabel)),
                      SizedBox(width: 10,),
                      xem==true?
                          SizedBox(width: 1,) :
                          ElevatedButton(
                              onPressed: () =>
                              Navigator.pop(context),
                              child: Text("Hủy")),
                      SizedBox(width: 10,)
                    ],
                  ),
                ],
              ),
            ),
       ),
    );
  }

  @override
  void initState() {
    super.initState();
    svs = widget.sinhVienSnapshot;
    xem= widget.xem;
    if (svs!=null){
      txtId.text=svs!.sinhVien!.id?? "";
      txtten.text=svs!.sinhVien!.ten?? "";
      txtlop.text=svs!.sinhVien!.lop?? "";
      txtquequan.text=svs!.sinhVien!.queQuan?? "";
      txtnamsinh.text=svs!.sinhVien!.namSinh?? "";
      if (xem!=true)
        {
          title = "Thông tin sinh viên";
          buttonLabel = "Đóng";
        }
      else
        {
          title = "Cập nhật thông tin";
          buttonLabel = "Cập nhật";
        }
    }
  }

  _chonAnh(BuildContext context) async{
    _xImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_xImage!=null)
      {
        setState(() {
          _imgageChange=true;
        });
      }
  }

   _capnhat(BuildContext context) async{
    showSnackBar(context, "Đang cập nhật dữ liệu", 300);
    SinhVien sv = SinhVien(
      id: txtId.text,
      ten: txtten.text,
      lop: txtlop.text,
      queQuan: txtquequan.text,
      namSinh: txtnamsinh.text,
      anh: null,
    );
    if (_imgageChange)
      {
        FirebaseStorage _storage = FirebaseStorage.instance;
        Reference reference = _storage.ref().child("images")
            .child("anh ${sv.id}.jpg");
        UploadTask uploadTask = await _uploadTask(reference,_xImage!);
        uploadTask.whenComplete(() async{
          sv.anh = await reference.getDownloadURL();
          if (svs!=null)
            _capnhatSV(svs, sv);
          else
            _themSV(sv);
        }).onError((error, stackTrace){
          return Future.error("Lỗi xảy ra");
        });
      }
    else
      if (svs!=null)
        {
          sv.anh = svs!.sinhVien!.anh;
          _capnhatSV(svs,sv);
        }
      else
        _themSV(sv);
  }
  Future<UploadTask> _uploadTask(Reference reference,XFile xImage) async
  {
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path':xImage.path}
    );
    UploadTask uploadTask;
    if (kIsWeb) {
      uploadTask = reference.putData(await xImage.readAsBytes(),metadata);
    } else {
      uploadTask = reference.putFile(File(xImage.path),metadata);
    }
    return Future.value(uploadTask);
  }

   _capnhatSV(SinhVienSnapshot? svs, SinhVien sv) {
    svs!.capNhap(sv).whenComplete(() =>
    showSnackBar(context, "Cập nhật dữ liệu thành công", 3))
        .onError((error, stackTrace) =>
        showSnackBar(context, "Cập nhật dữ liệu không thành công", 3));
   }

   _themSV(SinhVien sv) {
     SinhVienSnapshot.addNew(sv).whenComplete(() =>
         showSnackBar(context, "Thêm dữ liệu thành công", 3))
         .onError((error, stackTrace) {
       showSnackBar(context, "Thêm dữ liệu không thành công", 3);
       return Future.error("Lỗi khi thêm");
     });
   }
}
