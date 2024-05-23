import 'package:flutter/material.dart';
import 'package:image_sample/component/appbar_widget.dart';

class GIFShowPage extends StatelessWidget {
  const GIFShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: "Show GIF"),
      body: ListView(
        children: [
          Image.network(
            "https://velog.velcdn.com/images/tygerhwang/post/b3952b7b-a9e8-4c61-b692-76c96c3d4d9f/image.gif",
          ),
        ],
      ),
    );
  }
}
