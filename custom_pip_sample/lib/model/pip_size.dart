import 'package:custom_pip_sample/model/pip_type.dart';
import 'package:flutter/material.dart';

class PIPSize {
  final double? top;
  final double? left;
  final double width;
  final double height;
  final int duration;

  const PIPSize({
    this.top,
    this.left,
    this.width = 0,
    this.height = 0,
    this.duration = 0,
  });

  PIPSizeCopyWith get copyWith => PIPSizeImplementsCopyWith(this);

  factory PIPSize.init() => const PIPSize();

  factory PIPSize.floatingToPage(Size size, int duration, PIPSize position) =>
      PIPSize(
        top: position.top != null ? kToolbarHeight : null,
        left: position.left != null ? 0 : null,
        width: size.width,
        height: size.height - kToolbarHeight,
        duration: duration,
      );

  factory PIPSize.pageToFloating(Size size, int duration, PIPSize cache) =>
      PIPSize(
        top: cache.top ?? (size.height - ((size.width * 0.35) * 1.7777)) - 40,
        left: cache.left ?? (size.width * 0.65) - 20,
        width: size.width * 0.35,
        height: (size.width * 0.35) * 1.7777,
        duration: duration,
      );

  factory PIPSize.topPosition(Size size, int duration) => PIPSize(
        top: kTextTabBarHeight,
        left: 0,
        width: size.width,
        height: size.height,
        duration: duration,
      );

  factory PIPSize.bottomPosition(Size size, int duration) => PIPSize(
        top: size.height,
        width: size.width,
        height: size.height,
        duration: duration,
      );

  factory PIPSize.page(Size size, int duration) => PIPSize(
      top: kToolbarHeight,
      width: size.width,
      height: size.height,
      duration: duration);

  factory PIPSize.floating(Size size, int duration, FloatingType type) =>
      PIPSize(
        top: type == FloatingType.leftTop || type == FloatingType.rightTop
            ? kToolbarHeight + 40
            : (size.height - ((size.width * 0.35) * 1.7777)) - 40,
        left: type == FloatingType.leftTop || type == FloatingType.leftBottom
            ? 20
            : (size.width * 0.65) - 20,
        width: size.width * 0.35,
        height: (size.width * 0.35) * 1.7777,
        duration: duration,
      );
}

abstract class PIPSizeCopyWith {
  PIPSize call({
    final double? top,
    final double? left,
    final double width,
    final double height,
    final int duration,
  });
}

class PIPSizeImplementsCopyWith implements PIPSizeCopyWith {
  final PIPSize value;
  static const Object _un = Object();
  const PIPSizeImplementsCopyWith(this.value);
  @override
  PIPSize call({
    Object? top = _un,
    Object? left = _un,
    Object? width = _un,
    Object? height = _un,
    Object? duration = _un,
  }) {
    return PIPSize(
      top: top == _un ? value.top : top as double?,
      left: left == _un ? value.left : left as double?,
      width: width == _un ? value.width : width as double,
      height: height == _un ? value.height : height as double,
      duration: duration == _un ? value.duration : duration as int,
    );
  }
}
