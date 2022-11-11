import 'package:flutter/material.dart';
import 'views/countdown-page.dart';

void main() {
  runApp(Komodoro());
}

class Komodoro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Countdown app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountdownPage(),
    );
  }
}
