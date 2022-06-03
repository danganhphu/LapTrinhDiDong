import 'page_home_firebase_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApp extends StatefulWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  State<FirebaseApp> createState() => _FirebaseAppState();
}

class _FirebaseAppState extends State<FirebaseApp> {
  bool ketnoi = false;
  bool loi = false;
  @override
  Widget build(BuildContext context) {
    if (loi) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text("Có lỗi xảy ra", style: TextStyle(fontSize: 18,),textDirection: TextDirection.ltr,),
        ),
      );
    } else
      if (!ketnoi) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: Text("Đang kết nối", style: TextStyle(fontSize: 18,),textDirection: TextDirection.ltr,),
          ),
        );
      } else {
        return const MaterialApp(
        title: "Kết nối Firebase",
        home: PageSinhViens(),
      );
      }
  }
  @override
  void initState() {
    super.initState();
    _khoiTaoFirebase();
  }

   _khoiTaoFirebase() async{
    try
        {
          await Firebase.initializeApp();
          setState(() {
            loi = false;
            ketnoi = true;
          });


        }
    catch(e)
    {
      print(e);
      setState(() {
        ketnoi=false;
        loi = false;
      });
    }
  }

}
