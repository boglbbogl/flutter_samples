import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _top = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Custom PIP Sample",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
                top: _top,
                // bottom: 0,
                // left: 0,
                // right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _top = 100;
                    });
                  },
                  child: AnimatedContainer(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      color: Colors.red,
                      duration: Duration(seconds: 1)),
                ),
                duration: Duration(seconds: 1))
          ],
        ),
      ),
    );
  }
}
