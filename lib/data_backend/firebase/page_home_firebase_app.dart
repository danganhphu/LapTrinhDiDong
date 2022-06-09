import 'dialog.dart';
import 'firebase_data.dart';
import 'my_navbar.dart';
import 'page_firebase_detail_sv.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageSinhViens extends StatefulWidget {
  const PageSinhViens({Key? key}) : super(key: key);

  @override
  State<PageSinhViens> createState() => _PageSinhViensState();
}

class _PageSinhViensState extends State<PageSinhViens> {
  BuildContext? dialogContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("My Firebase app"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PageSVDetail(xem: false,),)),
              icon: Icon(Icons.add_circle_outline, color: Colors.white ,))
        ],
      ),
      body: StreamBuilder<List<SinhVienSnapshot>>(
        stream: SinhVienSnapshot.getAllSinhVien(),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text("Lỗi xảy ra khi truy vấn dữ liệu"),
            );
          }
          else if (!snapshot.hasData) {
            return const Center(
              child: Text("Đang tải dữ liệu...."),
            );
          } else {
            return ListView.separated(
                separatorBuilder: (context, index) =>
                const Divider(thickness: 1,),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  dialogContext = context;
                  return Slidable(
                    child: ListTile(
                      leading: Text("${snapshot.data![index].sinhVien!.id}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight
                            .bold),),
                      title: Text("${snapshot.data![index].sinhVien!.ten}"),
                      subtitle: Text("${snapshot.data![index].sinhVien!.lop}"),
                    ),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [],
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) =>
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    PageSVDetail(
                                      sinhVienSnapshot: snapshot.data![index],
                                      xem: true,),)),
                          icon: Icons.details,
                          foregroundColor: Colors.green,),
                        SlidableAction(
                          onPressed: (context) =>
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    PageSVDetail(
                                      sinhVienSnapshot: snapshot.data![index],
                                      xem: false,),)),
                          icon: Icons.edit,
                          foregroundColor: Colors.blue,),
                        SlidableAction(
                          onPressed: (context) {
                             _xoa(dialogContext!,snapshot.data![index]);
                          },
                          icon: Icons.delete_forever,
                          foregroundColor: Colors.red,),
                      ],
                    ),

                  );
                }
            );
          }
        })
    );
  }

   void _xoa(BuildContext buildContext, SinhVienSnapshot svs) async{
    String? confirm;
    confirm = await showConfirmDialog(context, "Bạn có muốn xóa sinh viên: ${svs.sinhVien!.ten}?");
    if (confirm=="ok")
      {
        FirebaseStorage _storage = FirebaseStorage.instance;
        Reference reference = _storage.ref().child("images")
     .child("anh_${svs.sinhVien!.id}.jpg");
        reference.delete();
        svs.delete().whenComplete(() => showSnackBar(context, "Xóa dữ liệu thành công", 3))
        .onError((error, stackTrace) {
          showSnackBar(context, "Xóa dữ liệu không thành công", 3);
          return Future.error("Xóa dữ liệu không thành công");
        });
      }
   }
}
