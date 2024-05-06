import 'package:flutter/material.dart';

enum BoxFitSizeType {
  horizontalRectangle("horizontal", 400, 250),
  verticalRectangle("vertical", 300, 600),
  square("square", 400, 400);

  final String name;
  final double? width;
  final double? height;

  const BoxFitSizeType(
    this.name,
    this.width,
    this.height,
  );
}

enum BoxFitType {
  original("Original", null),
  cover("Cover", BoxFit.cover),
  contain("Contain", BoxFit.contain),
  fitHeight("Fit Height", BoxFit.fitHeight),
  fitWidth("Fit Width", BoxFit.fitWidth),
  fill("Fill", BoxFit.fill),
  none("None", BoxFit.none),
  scaleDown("Scale Down", BoxFit.scaleDown);

  final String name;
  final BoxFit? fit;

  const BoxFitType(this.name, this.fit);
}
