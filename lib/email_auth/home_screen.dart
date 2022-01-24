import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user;

  @override
  void initState() {
    setState(() {
      user = context.read<AuthenticationService>().getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        title: const Text(
          'Flutter Firebase Auth',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Welcome to Geeks for Geeks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          SizedBox(
            height: 40,
          ),
          Center(
            child: user != null
                ? Image.asset(
                    'assets/firebase_logo.png',
                    height: 90,
                    width: 90,
                  )
                : Container(),
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            "Your email address is ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            user != null ? user.email : "No User Found",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 40,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              style: ElevatedButton.styleFrom(
                elevation: 6.0,
                primary: Colors.indigo, // background
                onPrimary: Colors.white, // foreground
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.indigo)),
              ),
              child: Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }
}
