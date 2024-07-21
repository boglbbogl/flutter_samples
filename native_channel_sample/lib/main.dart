import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MethodChannel channel = const MethodChannel("native/sample");

  void get() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("count", 99);
    await channel.invokeMethod("get").then((v) {
      print(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              get();
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
