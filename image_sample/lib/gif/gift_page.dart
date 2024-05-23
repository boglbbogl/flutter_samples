import 'package:flutter/material.dart';
import 'package:image_sample/component/appbar_widget.dart';
import 'package:image_sample/gif/gif_show_page.dart';
import 'package:image_sample/gif/gif_to_image_page.dart';

class GIFPage extends StatelessWidget {
  const GIFPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: "GIF"),
      body: ListView(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => GIFShowPage()));
              },
              child: Text("Show")),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => GIFToImagePage()));
              },
              child: Text("GIF to Images")),
          Text("Images to GIF"),
          Text("Show"),
        ],
      ),
    );
  }
}
