// Navigation Drawer
import 'package:flutter/material.dart';
import 'package:exito/google/home.dart';
import 'package:exito/Clase03/Page2.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(const Page3());

class Page3 extends StatelessWidget {
  const Page3({super.key});

  static const appTitle = 'Asignatura';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text(
          'Diseño de apps',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
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
              child: Text('Diseño de Apps'),
            ),
            ListTile(
              title: const Text('Alumno'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
            ListTile(
              title: const Text('Cuatrimestre'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page2()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
