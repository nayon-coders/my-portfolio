import 'package:flutter/material.dart';
import 'package:portfolio/firebase/admin/auth_controller.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  final _loginKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Container(
            height: 500,
            width: 700,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [

                Text("Login Nayon Vai",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Form(
                  key: _loginKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email"
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Password"
                        ),
                      ),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: ()async{
                          setState(() =>_isLoading = true);
                          await AuthController.signInWithEmailAndPassword(email: _email.text, pass: _password.text, context: context);
                          setState(() =>_isLoading = false);

                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(child: _isLoading ? CircularProgressIndicator(color: Colors.white,)  :Text("Login",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),),
                        ),
                      )
                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      )
    );
  }
}
