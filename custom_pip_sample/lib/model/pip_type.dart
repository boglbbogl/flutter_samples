enum ModeType { floating, page, none }

enum FloatingType {
  leftTop("Left Top"),
  rightTop("Right Top"),
  rightBottom("Right Bottom"),
  leftBottom("Left Bottom");

  final String code;

  const FloatingType(this.code);
}
