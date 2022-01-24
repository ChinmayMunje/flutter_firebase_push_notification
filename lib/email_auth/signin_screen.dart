import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xff10223d),
        title: const Text(
          'Sign in',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        autofocus: false,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Please enter your email',
                          labelStyle: TextStyle(
                              fontSize: 15.0, color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white, width: 1.0)),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        autofocus: false,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Please enter your password',
                          labelStyle: TextStyle(
                              fontSize: 15.0, color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white, width: 1.0)),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: passwordTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 6.0,
                        primary: Colors.indigo, // background
                        onPrimary: Colors.white, // foreground
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Colors.indigo)),
                      ),
                      onPressed: () {
                        context
                            .read<AuthenticationService>()
                            .signIn(
                              email: emailTextController.text.trim(),
                              password: passwordTextController.text.trim(),
                            )
                            .then(
                              (String result) => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(result),
                                duration: const Duration(milliseconds: 1200),
                              )),
                            );
                        //showSnackbar(context, result));
                      },
                      child: Text('Sign In'),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/signup',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",style: TextStyle(color: Colors.white),),
                        Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/resetPassword',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forget Password ",style: TextStyle(color: Colors.white),),
                        Text(
                          'Click here',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
