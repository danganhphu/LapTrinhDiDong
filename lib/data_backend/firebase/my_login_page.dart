import 'Account.dart';
import 'dialog.dart';
import 'my_Register.dart';
import 'page_firebase_app.dart';
import 'page_home_firebase_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_button/sign_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? error;


  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8,),
        child: Form(

          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: txtemail,
                decoration: const InputDecoration(
                  labelText: "Email...",
                ),
              ),
              TextFormField(
                controller: txtpassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password...",
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(buttonType: ButtonType.mail,
                      btnColor: Colors.indigoAccent,
                      btnText: "Sign in with Email",
                      btnTextColor: Colors.white,
                      onPressed: () {
                        if (txtemail.text!="" && txtpassword.text!="")
                          {
                            error="";
                            showSnackBar(context, "Sign in...", 3);
                            signWithEmailPassword(
                                Email: txtemail.text,
                                password: txtpassword.text)
                            .then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (
                                      context) => const FirebaseApp()),
                                      (Route<dynamic> route) => true);
                              showSnackBar(context, "Hello ${FirebaseAuth.instance
                                  .currentUser?.email ?? ""}", 5);
                            });
                          }
                          else
                            {
                              setState(() {
                                error = "Login fail";
                              });
                              showSnackBar(context, "Sign in not successfully", 3);
                            }
                            }
                      )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  TextButton(
                    child: Text("Register", style: TextStyle(color: Colors.lightBlue),),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (
                              context) => const RegisterPage()),
                              );
                        }
                    ),
                ],
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(buttonType: ButtonType.google,
                      btnColor: Colors.lightBlueAccent,
                      btnText: "Sign in with Google",
                      btnTextColor: Colors.black,
                      onPressed: () async
                      {
                        showSnackBar(context, "Sign in....", 5);
                        var user = await signWithGoogle();
                        if (user != null) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (
                                  context) => const PageSinhViens()),
                                  (Route<dynamic> route) => false);
                          showSnackBar(context, "Hello ${FirebaseAuth.instance
                              .currentUser?.email ?? ""}", 5);
                        }
                        else {
                          setState(() {
                            error = "Login fails";
                          });
                          showSnackBar(context, "Sign in not successfully", 3);
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),);
  }


  }


