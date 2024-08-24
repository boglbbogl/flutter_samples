import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isolate_example/appbar_widget.dart';
import 'package:shimmer/shimmer.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  void _nomal() {
    int result = 0;
    while (result < 10000000000) {
      result++;
    }
  }

  void _isolate() async {
    final ReceivePort receivePort = ReceivePort();

    final Isolate isolate =
        await Isolate.spawn(_calculateInIsolate, receivePort.sendPort);
    receivePort.listen((message) {
      print(message);
      receivePort.close();
      isolate.kill();
    });
  }

  static void _calculateInIsolate(SendPort sendPort) {
    int current = 0;
    while (current < 10000000000) {
      current++;
    }
    sendPort.send(current);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        appBar: const AppbarWidget(title: "Calculate"),
        body: Column(
          children: [
            Shimmer.fromColors(
              baseColor: const Color.fromRGBO(81, 81, 81, 1),
              highlightColor: const Color.fromRGBO(155, 155, 155, 1),
              child: Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _button("Nomal", _nomal),
                _button("Isolate", _isolate),
              ],
            )
          ],
        ));
  }

  Shimmer _button(String content, Function() onTap) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(155, 155, 155, 1),
      highlightColor: const Color.fromRGBO(215, 215, 215, 1),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            content,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
