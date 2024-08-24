import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isolate_example/appbar_widget.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int _count = 0;

  bool _isLoading = false;

  void _increment() => setState(() => _count++);

  void _decrement() => setState(() => _count--);

  void _reset() => setState(() => _count = 0);

  void _normalCalculation() {
    if (!_isLoading) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(milliseconds: 1000), () {
        int result = 0;
        while (result < 10000000000) {
          result++;
        }
        setState(() => _isLoading = false);
      });
    }
  }

  Future<void> _isolateCalculation() async {
    if (!_isLoading) {
      setState(() => _isLoading = true);

      final ReceivePort receivePort = ReceivePort();

      final Isolate isolate =
          await Isolate.spawn(_calculateInIsolate, receivePort.sendPort);
      receivePort.listen((message) {
        setState(() {
          _isLoading = false;
        });
        receivePort.close();
        isolate.kill();
      });
    }
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
      appBar: const AppbarWidget(title: "Count"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 48),
            child: Text(
              _count.toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button(Icons.add, _increment),
                _button(Icons.refresh_rounded, _reset),
                _button(Icons.remove, _decrement),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 48),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _calculateButton("Nomal", _normalCalculation),
                _calculateButton("Isolate", _isolateCalculation),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _calculateButton(String content, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 115,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.amber),
        alignment: Alignment.center,
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : Text(
                content,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
      ),
    );
  }

  GestureDetector _button(IconData icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(115, 115, 115, 1),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
