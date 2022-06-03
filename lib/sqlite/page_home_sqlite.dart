import 'page_home_sqlite_detail.dart';
import 'provider_sqlite.dart';
import 'sqlite_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'dialog.dart';

class PageListUserSQLite extends StatefulWidget {
  const PageListUserSQLite({Key? key}) : super(key: key);

  @override
  State<PageListUserSQLite> createState() => _PageListUserSQLiteState();
}

class _PageListUserSQLiteState extends State<PageListUserSQLite> {
  late BuildContext listviewContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite Demo"),
        actions: [
          IconButton(
              onPressed:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageUsersSQLiteDetail(xem:false),));
              },
              icon: Icon(Icons.add_circle, size: 40)),
        ],
      ),
      body: Consumer<DatabaseProvider>(builder: (context, databaseProvider, child) {
        listviewContext = context;
        if(databaseProvider.user == null)
        {
          return Text("Chưa có dữ liệu");
        }
        else {return ListView.separated(
            itemBuilder: (context, index) {
              User user = databaseProvider.user![index];
              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async {
                        String? confirm = await showConfirmDialog(listviewContext,
                            "Bạn muốn xóa Sản phẩm ${user.name}");
                        if(confirm == "ok") {
                          var provider = listviewContext.read<DatabaseProvider>();
                          provider.deleteUser(user.id!);
                        }
                      },
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PageUsersSQLiteDetail(xem: false,user: user,)));
                      },
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PageUsersSQLiteDetail(xem: true,user: user,)));
                      },
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.details,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Text("${user.id}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  title: Text("${user.name}",style: const TextStyle(fontSize: 18, color: Colors.indigo),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: ${user.phone}"),
                      Text("Email: ${user.email}")
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(thickness: 1,),
            itemCount: databaseProvider.user!.length
        );}
      }),
    );
  }

  @override
  void dispose() {
    DatabaseProvider provider = context.read<DatabaseProvider>();
    provider.closeDatabase();
  }

}
