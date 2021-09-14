import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartforce/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SmartforceTest());
}

class SmartforceTest extends StatelessWidget {
  const SmartforceTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          centerTitle: true,
        ),
      ),
      home: Home(),
    );
  }
}
