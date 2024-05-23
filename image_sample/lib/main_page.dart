import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_sample/boxfit/boxfit_page.dart';
import 'package:image_sample/gif/gift_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          _item("BoxFit", const BoxFitPage()),
          _item("GIF", const GIFPage()),
        ],
      ),
    );
  }

  GestureDetector _item(String title, Widget child) => GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => child));
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          width: MediaQuery.of(context).size.width,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
}
