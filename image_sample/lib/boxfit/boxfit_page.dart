import 'package:flutter/material.dart';
import 'package:image_sample/boxfit/boxfit_type.dart';

class BoxFitPage extends StatefulWidget {
  final BoxFitType type;
  final BoxFitSizeType? size;
  const BoxFitPage({
    super.key,
    required this.type,
    required this.size,
  });

  @override
  State<BoxFitPage> createState() => _BoxFitPageState();
}

class _BoxFitPageState extends State<BoxFitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (widget.size != null) ...[
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    Text(
                      "width : ${widget.size?.width}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "height : ${widget.size?.height}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
            Container(
              color: Colors.amber,
              width: widget.size?.width,
              height: widget.size?.height,
              child: Image.network(
                "https://velog.velcdn.com/images/tygerhwang/post/ca402d77-a553-4846-b2cd-70e36fd2a812/image.jpg",
                fit: widget.type.fit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
