import 'dialog.dart';
import 'my_login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: Column(

         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Padding(padding: EdgeInsets.all(15,)),
           Text("My firebase app",style: TextStyle(fontSize: 15),),
           SizedBox(width: 15,),
           ElevatedButton(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.exit_to_app),
                 Text("Sign out"),
                 SizedBox(height: 10,width: 5,)
               ],
             ),
           onPressed: (){
               showSnackBar(context, "Sign out...", 5);
               FirebaseAuth.instance.signOut().whenComplete(() {
                 Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context) => const LoginPage()), (Route<dynamic> route) => false);
                 showSnackBar(context, "Please sign in", 5);
               }).catchError((error){
                 showSnackBar(context, "Sign out not sucessfully!", 3);
               });

               
           },)
         ],
       ),
      );
  }
}

