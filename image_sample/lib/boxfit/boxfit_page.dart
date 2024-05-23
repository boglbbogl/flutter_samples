import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_sample/boxfit/boxfit_detail_page.dart';
import 'package:image_sample/boxfit/boxfit_type.dart';
import 'package:image_sample/component/appbar_widget.dart';

class BoxFitPage extends StatefulWidget {
  const BoxFitPage({super.key});

  @override
  State<BoxFitPage> createState() => _BoxFitPageState();
}

class _BoxFitPageState extends State<BoxFitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: "BoxFit"),
      body: ListView(
        children: [
          _boxFitItem(BoxFitType.original, isOne: true, top: 24),
          _boxFitItem(BoxFitType.contain),
          _boxFitItem(BoxFitType.cover),
          _boxFitItem(BoxFitType.fill),
          _boxFitItem(BoxFitType.fitHeight),
          _boxFitItem(BoxFitType.fitWidth),
          _boxFitItem(BoxFitType.none),
          _boxFitItem(BoxFitType.scaleDown),
        ],
      ),
    );
  }

  Container _boxFitItem(
    BoxFitType type, {
    bool isOne = false,
    double top = 0,
  }) =>
      Container(
        height: 40,
        color: Colors.transparent,
        margin: EdgeInsets.only(left: 30, right: 20, top: top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Row(
              children: [
                ...List.generate(
                  isOne ? 1 : 3,
                  (i) => GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BoxFitDetailPage(
                                type: type,
                                size: isOne
                                    ? null
                                    : (i == 0
                                        ? BoxFitSizeType.square
                                        : i == 1
                                            ? BoxFitSizeType.horizontalRectangle
                                            : BoxFitSizeType.verticalRectangle),
                              )));
                    },
                    child: Container(
                      height: 35,
                      margin:
                          isOne ? null : EdgeInsets.only(right: i != 2 ? 8 : 0),
                      width: isOne ? 226 : 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        isOne
                            ? "original"
                            : i == 0
                                ? BoxFitSizeType.square.name
                                : i == 1
                                    ? BoxFitSizeType.horizontalRectangle.name
                                    : BoxFitSizeType.verticalRectangle.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
