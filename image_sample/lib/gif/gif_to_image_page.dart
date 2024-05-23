import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_sample/component/appbar_widget.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class GIFToImagePage extends StatefulWidget {
  const GIFToImagePage({super.key});

  @override
  State<GIFToImagePage> createState() => _GIFToImagePageState();
}

class _GIFToImagePageState extends State<GIFToImagePage> {
  final String url =
      "https://velog.velcdn.com/images/tygerhwang/post/b3952b7b-a9e8-4c61-b692-76c96c3d4d9f/image.gif";

  final List<File> images = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _extractFrameAsPng();
  }

  Future<void> _extractFrameAsPng() async {
    final http.Response response = await http.get(Uri.parse(url));
    final Uint8List gifBytes = response.bodyBytes;
    final ui.Codec codec = await ui.instantiateImageCodec(gifBytes);
    final int frameCount = codec.frameCount;
    final directory = await getApplicationDocumentsDirectory();

    for (int i = 0; i < frameCount; i++) {
      final ui.FrameInfo frameInfo = await codec.getNextFrame();
      final ui.Image frame = frameInfo.image;
      final ByteData? byteData =
          await frame.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        final Uint8List pngBytes = byteData.buffer.asUint8List();
        final File file = File("${directory.path}/frame_$i.png");
        await file.writeAsBytes(pngBytes);
        images.add(file);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: "To Images"),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ...List.generate(
                  images.length,
                  (index) => Container(
                    height: 130,
                    color: Colors.red,
                    child: Stack(
                      children: [
                        Image.file(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                        Text(index.toString())
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
