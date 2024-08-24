import 'package:flutter/material.dart';
import 'package:isolate_example/animation_page.dart';
import 'package:isolate_example/appbar_widget.dart';
import 'package:isolate_example/calculate_page.dart';
import 'package:isolate_example/count_page.dart';
import 'package:isolate_example/video_download_page.dart';

void main() {
  runApp(const MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: const AppbarWidget(
        title: "Isolate Sample",
        isLeading: false,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          _button("Calculate", const CalculatePage()),
          _button("Count", const CountPage()),
          _button("Animation", const AnimationPage()),
          _button("Video Download", const VideoDownloadPage()),
        ],
      ),
    );
  }

  GestureDetector _button(String title, Widget widget) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(66, 66, 66, 1),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
