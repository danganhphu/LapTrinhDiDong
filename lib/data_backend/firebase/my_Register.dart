import 'Account.dart';
import 'dialog.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? error;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtrepassword = TextEditingController();
  bool hide= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8,),
        child: Form(
          key: _form,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: txtemail,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                controller: txtpassword,
                obscureText: hide,
                decoration: InputDecoration(
                  labelText: "Your password:",
                  suffixIcon: GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        hide=!hide;
                      });
                    },
                    child: Icon(hide ? Icons.visibility : Icons.visibility_off),
                  ) ,
                ),
              ),
              TextFormField(
                controller: txtrepassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Retype your password:",
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 FloatingActionButton.extended(
                   icon: Icon(Icons.vpn_key),
                   label: Text("Register"),
                    onPressed: () {
                      bool? validate = _form.currentState?.validate();
                      if (validate == true) {
                        error = "";
                        showSnackBar(context, "Registering....", 3);
                        registerEmailPassword(Email: txtemail.text,
                            password: txtpassword.text)
                            .then((value) {
                          setState(() {
                            error = "Register successfully!";
                          });
                          showSnackBar(context, "Register successfully!", 3);
                        })
                            .catchError((error) {
                          setState(() {
                            this.error = error;
                          });
                          showSnackBar(
                              context, "Register not successfully!", 3);
                        });
                      }
                    })
                ],
              ),

            ],
          ),
        ),
      ),);
  }

}
