import 'sqlite_data.dart';
import 'package:flutter/foundation.dart';

class DatabaseProvider extends ChangeNotifier{
  DatabaseHelper? databaseHelper;
  List<User>? _user;
  DatabaseProvider()
  {
    databaseHelper = DatabaseHelper();
  }
  List<User>? get user => _user;
  void readUser() async
  {
    if(user==null)
      {
        databaseHelper!.open().whenComplete(() async{
          _user=await databaseHelper!.getUsers().whenComplete(() => notifyListeners());
        });
      }
  }
  Future<int> updateUser(User user,int id) async
  {
    int count = await databaseHelper!.update(user, id)
        .whenComplete(() async{
      _user=await databaseHelper!.getUsers().whenComplete(() => notifyListeners());
    });
    return count;
  }
  Future<int> insertUser(User user) async
  {
    int id = await databaseHelper!.insert(user)
        .whenComplete(() async{
      _user=await databaseHelper!.getUsers().whenComplete(() => notifyListeners());
    });
    return id;
  }
  Future<int> deleteUser(int id) async
  {
    int count = await databaseHelper!.delete(id)
        .whenComplete(() async{
      _user=await databaseHelper!.getUsers().whenComplete(() => notifyListeners());
    });
    return count;
  }
  void closeDatabase(){
    databaseHelper!.closeDatabase();
  }
}