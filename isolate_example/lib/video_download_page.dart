import 'package:flutter/material.dart';
import 'package:isolate_example/appbar_widget.dart';

class VideoDownloadPage extends StatefulWidget {
  const VideoDownloadPage({super.key});

  @override
  State<VideoDownloadPage> createState() => _VideoDownloadPageState();
}

class _VideoDownloadPageState extends State<VideoDownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppbarWidget(title: "Video Download"),
    );
  }
}
