import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:danganhphu_61134177/state/list_mathang_provider.dart';
import 'Them_Sua.dart';
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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThemSuaPage())
              ),
              icon: const Icon(Icons.add_circle))
        ],
      ),
      body: Consumer<QuanLySanPham> (
        builder: (context, qlSanPham, child) {
          listviewContext = context;
          return ListView.builder(
            itemCount: qlSanPham.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  leading: const Icon( Icons.shopping_cart, color: Colors.blue,),
                  title: Text(qlSanPham.list[index].ten.toString()),
                  subtitle: Text(qlSanPham.list[index].chuThich),
                  trailing: Text(qlSanPham.list[index].gia.toString()),
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
                        String? confirm = await showDelete(
                            listviewContext,
                            "Bạn có muốn xóa sản phẩm " + qlSanPham.list[index].ten+ " không?");
                        if (confirm == "ok") {
                          var provider = listviewContext.read<QuanLySanPham>();
                          provider.delete(qlSanPham.list[index]);
                        }
                      },
                    ),
                    SlidableAction(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      icon: Icons.update,
                      label: 'Sửa',
                      onPressed: (context) {

                      },
                        //   Navigator.push(context,
                        // MaterialPageRoute(builder: (context) {
                        //   return ThemSuaPage(
                        //       kieu: 'sua',
                        //       sp: qlSanPham.list[index]);
                        // })),
                    ),
                    SlidableAction(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.remove_red_eye,
                      label: 'Xem',
                      onPressed: (context) async {
                        await showDeail(
                            listviewContext,
                            qlSanPham.list[index].ten,
                            qlSanPham.list[index].chuThich,
                            qlSanPham.list[index].gia.toString()
                        );
                      },
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