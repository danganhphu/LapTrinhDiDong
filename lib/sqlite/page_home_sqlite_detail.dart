
import 'package:danganhphu_61134177/sqlite/provider_sqlite.dart';
import 'package:flutter/material.dart';
import 'provider_sqlite.dart';
import 'sqlite_data.dart';
import 'package:provider/provider.dart';

import 'dialog.dart';

class PageUsersSQLiteDetail extends StatefulWidget {
  User? user;
  bool? xem;
  PageUsersSQLiteDetail({Key? key,this.xem, this.user}) : super(key: key);

  @override
  State<PageUsersSQLiteDetail> createState() => _PageUsersSQLiteDetailState();
}

class _PageUsersSQLiteDetailState extends State<PageUsersSQLiteDetail> {
  bool? xem;
  User? user;
  String title = "Thông tin user";
  String buttonTittle = "Đóng";

  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  controller: txtName,
                  decoration: const InputDecoration(
                      labelText: "Tên: "
                  )
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: txtPhone,
                decoration: const InputDecoration(
                    labelText: "Điện thoại"
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email"
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () => _capNhat(context), child: Text(buttonTittle)),
                  const SizedBox(width: 10,),
                  xem == true ?  const SizedBox(width: 1,):
                  ElevatedButton(onPressed:() => Navigator.of(context).pop(), child: const Text("Đóng")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    xem = widget.xem;
    user = widget.user;
    if(user != null){
      if(xem != true)
      {
        title = "Chỉnh sửa user";
        buttonTittle ="Cập nhật";
      }
      txtName.text = user!.name!;
      txtPhone.text = user!.phone!;
      txtEmail.text = user!.email!;
    }
    else{
      title = "Thêm User";
      buttonTittle ="Thêm";
    }
  }

  @override
  void dispose() {
    super.dispose();
    txtName.dispose();
    txtPhone.dispose();
    txtEmail.dispose();
  }

  _capNhat(BuildContext context) async{
    if(xem == true){
      Navigator.of(context).pop();
    }
    else {
      DatabaseProvider provider = context.read<DatabaseProvider>();
      User nUser = User(name: txtName.text, phone: txtPhone.text, email: txtEmail.text);
      if(user == null)
      {
        int id= -1;
        id = await provider.insertUser(nUser);
        if(id > 0){
          showSnackBar(context, "Đã thêm ${nUser.name}", 3);
        }
        else {
          showSnackBar(context, "Thêm ${nUser.name} không thành công", 3);
        }
      }
      else{
        int count = 0;
        count = await provider.updateUser(nUser, user!.id!);
        if(count > 0){
          showSnackBar(context, "Đã cập nhật${nUser.name}", 3);
        }
        else {
          showSnackBar(context, "Cập nhật ${nUser.name} không thành công", 3);
        }
      }
    }
  }
}
