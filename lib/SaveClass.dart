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
  String _contador="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    IncreaseDataFromSharedPref();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _contador, style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  //Almacenar un valor en Shared Preferences
  Future <int> getDataFromSharedPref() async{
    final sharedprefs = await SharedPreferences.getInstance();
    var numero = sharedprefs.getInt('numero_inicio')??0;
    print(numero);
    return numero;
  }

  //Modificar el valor almacenado (INCREMENTAR)
  Future <void> IncreaseDataFromSharedPref() async{
    final sharedprefs = await SharedPreferences.getInstance();
    int ultimonumero = await getDataFromSharedPref();
    int numerosumado = ++ultimonumero;
    await sharedprefs.setInt('numero_inicio', numerosumado);
    setState(() {
      _contador = 'La aplicación se ha iniciado $numerosumado';
    });
  }
}
