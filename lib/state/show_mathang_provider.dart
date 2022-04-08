import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:danganhphu_61134177/state/list_mathang_provider.dart';
import 'action_provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late BuildContext listviewContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách sản phẩm"),
        actions: [
          IconButton(
              onPressed: (){
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
      body: Consumer<QuanLySanPham> (
        builder: (context, value, child) {
          listviewContext = context;
          return ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  leading: const Icon( Icons.shopping_cart, color: Colors.blue,),
                  title: Text(value.list[index].ten.toString()),
                  subtitle: Text(value.list[index].chuThich),
                  trailing: Text(value.list[index].gia.toString()),
                ),
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Xóa',
                      onPressed: (context) async {
                        String? confirm = await showFunction(
                            listviewContext,
                            "Bạn có muốn xóa sản phẩm " + value.list[index].ten+ " không?");
                        if (confirm == "ok") {
                          var provider = listviewContext.read<QuanLySanPham>();
                          provider.delete(value.list[index]);
                        }
                      },
                    ),
                    SlidableAction(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      icon: Icons.update,
                      label: 'Sửa',
                      onPressed: (BuildContext context) { },
                    ),
                    SlidableAction(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.remove_red_eye,
                      label: 'Xem',
                      onPressed: (BuildContext context) { },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}