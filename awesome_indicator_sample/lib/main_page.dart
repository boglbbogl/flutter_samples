import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _panoramaController = ScrollController();

  int ratio = 0;
  double pixel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        centerTitle: false,
        title: const Text(
          "Awesome Indicator",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.amber,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  ...List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/horizontal_sample_${index + 1}.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          AwesomeScrollIndicator(
            controller: _horizontalController,
            width: MediaQuery.of(context).size.width - 40,
            indicator: 0.35,
            backgroud: const Color.fromRGBO(96, 96, 96, 1),
            color: Colors.amber,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 500,
            child: SingleChildScrollView(
              controller: _panoramaController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/horizontal_panorama.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          AwesomeScrollIndicator(
            width: MediaQuery.of(context).size.width - 40,
            height: 8,
            backgroud: const Color.fromRGBO(66, 66, 66, 1),
            color: Colors.white,
            controller: _panoramaController,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
