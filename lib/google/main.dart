import 'package:exito/google/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'singin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(googleSignin());
}

class googleSignin extends StatefulWidget {
  googleSignin({Key? key}) : super(key: key);

  @override
  State<googleSignin> createState() => _googleSigninState();
}

class _googleSigninState extends State<googleSignin> {
  bool islogged = false;
  @override
  void initState() {
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      islogged = true;
    } else {
      islogged = false;
    }
    print("Usuario");
    print(user?.displayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = firebaseAuth.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: islogged ? HomePage() : const SingIn(),
    );
  }
}
/*homepage: agregar boton para salir
*/
