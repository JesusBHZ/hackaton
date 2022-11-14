import 'package:flutter/material.dart';

class Respiracion extends StatefulWidget {
  const Respiracion({Key? key}) : super(key: key);

  @override
  _RespiracionState createState() => _RespiracionState();
}

class _RespiracionState extends State<Respiracion> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Text('Respiración',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.1, 0.15),
                child: SelectionArea(
                  child: Text(
                      'Este es un momento para respirar...\nINHALA Y EXALA',
                      style: TextStyle()),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.05, -0.05),
                child: Image.asset(
                  'assets/tranquilidad.jpg',
                  width: 300,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
