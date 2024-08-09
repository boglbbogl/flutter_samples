import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isolate_example/appbar_widget.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  bool isLoading = false;
  int result = 0;

  void _calculate() {
    if (!isLoading) {
      setState(() => isLoading = true);
      Future.delayed(const Duration(milliseconds: 1000), () {
        for (int i = 0; i < 2000; i++) {
          for (int j = 0; j < 2000; j++) {
            for (int k = 0; k < 2000; k++) {
              result++;
            }
          }
        }
        setState(() => isLoading = false);
      });
    }
  }

  Future<void> _isolateCalculation() async {
    if (!isLoading) {
      final ReceivePort _receivePort = ReceivePort();
      await Isolate.spawn(_calculateInIsolate, _receivePort.sendPort);
      _receivePort.listen((message) {
        print(message);
      });
    }
  }

  static void _calculateInIsolate(SendPort sendPort) {
    int result = 0;
    for (int i = 0; i < 2000; i++) {
      for (int j = 0; j < 2000; j++) {
        for (int k = 0; k < 2000; k++) {
          result++;
        }
      }
    }
    sendPort.send(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: const AppbarWidget(title: "Calculate"),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 48, bottom: 12),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(75, 75, 75, 1),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Result",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 124,
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.amber,
                        )
                      : Text(
                          "$result",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                ),
              ],
            ),
          ),
          _button("Nomal Calculation", _calculate),
          _button("Isolate Calculation", _isolateCalculation),
        ],
      ),
    );
  }

  GestureDetector _button(String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        width: MediaQuery.of(context).size.width,
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromRGBO(75, 75, 75, 1),
          ),
        ),
      ),
    );
  }
}
