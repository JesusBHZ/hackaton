import 'package:exito/google/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'singin.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagina principal")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(user.email!),
          Text(user.displayName!),
          MaterialButton(
            onPressed: () {
              logout();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SingIn()));
            },
            child: Text(
              "Log Out",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            color: Colors.blueAccent,
          ),
        ],
      )),
    );
  }
}

Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
  print("User logged out");
}
