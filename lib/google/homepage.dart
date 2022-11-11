import 'package:exito/google/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'singin.dart';
import 'minijuegos.dart';
import 'countdown/main.dart';
import 'audios.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Waby",
            )),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hola",
                  style: TextStyle(fontSize: 30),
                ),
                Image.asset(
                  'assets/huella.jpg',
                  width: 200,
                  height: 200,
                ),
              ],
            )),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Asistencia'),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Ejercicio fisico'),
                trailing: Icon(Icons.home),
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));*/
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Mini juegos'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MiniJuegos()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Video'),
                trailing: Icon(Icons.home),
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));*/
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Audios'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Metodo Komodoro'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Komodoro()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Respiracion'),
                trailing: Icon(Icons.home),
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));*/
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Seguimiento'),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Diaro'),
                trailing: Icon(Icons.home),
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));*/
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Expediente'),
                trailing: Icon(Icons.home),
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));*/
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Cerrar sesion'),
                trailing: Icon(Icons.home),
                onTap: () {
                  logout();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SingIn()));
                },
              ),
            ],
          ),
        ));
  }
}

Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
  print("User logged out");
}
