import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.redAccent,
              Colors.blueAccent,
            ])),
        child: Card(
          margin: EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Google Sign In    ",
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MaterialButton(
                  onPressed: () {
                    signUp(context);
                  },
                  color: Colors.teal[100],
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/google.png"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Sign In with Google')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Future<void> signUp(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(authCredential);
    User? user = userCredential.user;
    if (userCredential != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(user: user!,)));
    }
  }
}

Future<void> signOutGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();
}
