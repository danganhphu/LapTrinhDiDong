import 'package:flutter/material.dart';
import 'form_model.dart';

class MyFormMatHang extends StatelessWidget {
  MyFormMatHang({Key? key}) : super(key: key);

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSoLuong = TextEditingController();

  MatHang mh = MatHang();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formState,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                controller: txtName,
                onSaved: (newValue) => mh.name = newValue,
                validator: (value) => validateString(value),
                decoration: const InputDecoration(
                    labelText: "Tên mặt hàng"
                ),
              ),
              DropdownButtonFormField<String>(
                onChanged: (value) => dropdownValue = value,
                onSaved: (newValue) => mh.loaiMH = newValue,
                validator: (value) => validateString(value),

                decoration: const InputDecoration(
                  labelText: "Loại mặt hàng",
                ),
                items: loaiMHs.map((
                    loaiMH) => DropdownMenuItem<String>(
                  child: Text(loaiMH),
                  value: loaiMH,
                ))
                    .toList(),
              ),
              TextFormField(
                controller: txtSoLuong,
                keyboardType: TextInputType.number,
                onSaved: (newValue) => mh.soluong = int.parse(newValue!),
                validator: (value) => validateSoLuong(value),
                decoration: const InputDecoration(
                  labelText: "Số lượng",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () => _save(context),
                      child: const Text("Save"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _save(BuildContext context) {
    if (formState.currentState!.validate()){
      formState.currentState!.save();
      hienThiDiaLog(context);
    }
  }

  validateSoLuong(String? value) {
    if (value == null || value.isEmpty) {
      return "Bạn chưa nhập số lượng";
    } else {
      return int.parse(value)<=0 ? "Số lượng không được bé hơn 0" :null;
    }

  }
//VALIDATE DUNG TRA VE NULL. SAI TRA VE CHUOI
  validateString(String? value) {
    return value == null || value.isEmpty ? "Bạn chưa nhâp dữ liệu" :null;
  }

  void hienThiDiaLog(BuildContext context) {
    var dialog = AlertDialog(
      title: const Text("Thông báo"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Bạn đã nhập mặt hàng"),
          Text("Tên mặt hàng: ${mh.name}"),
          Text("Loại mặt hàng: ${mh.loaiMH}"),
          Text("Số lượng: ${mh.soluong}"),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Xác nhận"))
      ],
    );
    showDialog(
        context: context,
        builder: (context) => dialog);
  }
}

