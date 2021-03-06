import 'page_home_sqlite.dart';
import 'provider_sqlite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SQLiteApp extends StatefulWidget {
  const SQLiteApp({Key? key}) : super(key: key);

  @override
  State<SQLiteApp> createState() => _SQLiteAppState();
}

class _SQLiteAppState extends State<SQLiteApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      var databaseProvider = DatabaseProvider();
      databaseProvider.readUser();
      return databaseProvider;
    },
    child: MaterialApp(
      home:PageListUserSQLite(),
    ),);
  }
}
