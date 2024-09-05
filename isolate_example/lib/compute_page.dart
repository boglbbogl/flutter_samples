import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isolate_example/appbar_widget.dart';

class ComputePage extends StatefulWidget {
  const ComputePage({super.key});

  @override
  State<ComputePage> createState() => _ComputePageState();
}

class _ComputePageState extends State<ComputePage> {
  bool isLoading = false;
  int result = 0;

  void _normalCalculation() {
    if (!isLoading) {
      setState(() => isLoading = true);
      Future.delayed(const Duration(milliseconds: 1000), () {
        result = 0;
        while (result < 10000000000) {
          result++;
        }
        setState(() => isLoading = false);
      });
    }
  }

  static int _calculateInIsolate(int value) {
    int current = value;
    while (current < 10000000000) {
      current++;
    }
    return current;
  }

  void _isolateCalculation() async {
    setState(() => isLoading = true);
    int current = await compute(_calculateInIsolate, 10);
    result = current;
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: const AppbarWidget(title: "Compute"),
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
                        fontSize: 22),
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
                            fontSize: 18,
                          ),
                        ),
                ),
              ],
            ),
          ),
          _button("Normal Calculation", _normalCalculation),
          _button("Compute Calculation", _isolateCalculation),
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
