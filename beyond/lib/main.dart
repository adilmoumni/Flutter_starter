import 'package:beyond/Authentication/SignIn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boyond',
      theme: ThemeData(),

      // This Widget in the first page of the page
      home: Scaffold(
        body: SignIn(),
      ),
    );
  }
}
