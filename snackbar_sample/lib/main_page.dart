import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.ease)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
          print("object");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              controller.reverse();
              controller.forward();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(milliseconds: 5000),
                backgroundColor: Colors.white.withOpacity(0.1),
                elevation: 0,
                animation: animation,
                content: FadeTransition(
                  opacity: controller,
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 40,
                      color: Colors.amber,
                      child: Text("!23213123")),
                ),
              ));
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
