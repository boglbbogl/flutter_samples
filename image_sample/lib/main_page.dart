import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_sample/boxfit/boxfit_page.dart';
import 'package:image_sample/boxfit/boxfit_type.dart';

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
          _item("BoxFit", [
            _boxFitItem(BoxFitType.original, isOne: true),
            _boxFitItem(BoxFitType.contain),
            _boxFitItem(BoxFitType.cover),
            _boxFitItem(BoxFitType.fill),
            _boxFitItem(BoxFitType.fitHeight),
            _boxFitItem(BoxFitType.fitWidth),
            _boxFitItem(BoxFitType.none),
            _boxFitItem(BoxFitType.scaleDown),
          ]),
        ],
      ),
    );
  }

  Container _boxFitItem(
    BoxFitType type, {
    bool isOne = false,
  }) =>
      Container(
        height: 40,
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 30, right: 20),
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
                          builder: (_) => BoxFitPage(
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

  Column _item(String content, List<Widget> children) => Column(
        children: [
          Container(
              height: 52,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: Text(
                content,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          ...children,
        ],
      );
}
