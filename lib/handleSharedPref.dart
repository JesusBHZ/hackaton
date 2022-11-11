import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkDataFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                SaveDataToSharedPref();
              },
              child: Text("Guardar Datos"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                DeleteDataToSharedPref();
              },
              child: Text("Eliminar Datos"),
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> SaveDataToSharedPref() async {
    final sharedprefs = await SharedPreferences.getInstance();
    String usuario = "1721110061@utectulancingo.edu.mx";
    String contrasenia = "QWERTY";
    await sharedprefs.setString('usuario', usuario);
    await sharedprefs.setString('contrasenia', contrasenia);
  }

  Future<void> checkDataFromSharedPref() async {
    final sharedprefs = await SharedPreferences.getInstance();
    Object? usuario = await sharedprefs.get("usuario");
    Object? contrasenia = await sharedprefs.get("contrasenia");
    print(usuario);
    print(contrasenia);

    if (usuario != null && contrasenia != null) {
      Fluttertoast.showToast(
          msg: "Ya se ha logueado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "No Existe Registro",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }

  Future<void> DeleteDataToSharedPref() async {
    final sharedprefs = await SharedPreferences.getInstance();

    if (sharedprefs.containsKey("usuario") &&
        sharedprefs.containsKey("contrasenia")) {
      sharedprefs.remove("usuario");
      sharedprefs.remove("contrasenia");
    }
  }
}
