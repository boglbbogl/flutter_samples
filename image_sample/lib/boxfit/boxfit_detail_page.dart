import 'package:flutter/material.dart';
import 'package:image_sample/boxfit/boxfit_type.dart';
import 'package:image_sample/component/appbar_widget.dart';

class BoxFitDetailPage extends StatefulWidget {
  final BoxFitType type;
  final BoxFitSizeType? size;
  const BoxFitDetailPage({
    super.key,
    required this.type,
    required this.size,
  });

  @override
  State<BoxFitDetailPage> createState() => _BoxFitDetailPageState();
}

class _BoxFitDetailPageState extends State<BoxFitDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.type.name),
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
                "https://velog.velcdn.com/images/tygerhwang/post/80dd2a88-9792-4915-96df-f2078d3a07bd/image.jpg",
                fit: widget.type.fit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
