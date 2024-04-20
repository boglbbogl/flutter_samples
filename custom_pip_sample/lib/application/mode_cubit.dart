import 'package:custom_pip_sample/application/mode_state.dart';
import 'package:custom_pip_sample/model/pip_type.dart';
import 'package:custom_pip_sample/model/pip_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModeCubit extends Cubit<ModeState> {
  late final Size _deviceSize;
  final int _duration = 300;

  ModeCubit()
      : super(ModeState(
          size: PIPSize.init(),
          cacheFloating: PIPSize.init(),
        ));

  void onUpdateFloating(DragUpdateDetails details) {
    if (!state.isAnimated) {
      double top = (state.size.top ?? 0) + details.delta.dy;
      double left = (state.size.left ?? 0) + details.delta.dx;
      emit(state.copyWith(
        size: state.size.copyWith(top: top, left: left, duration: 0),
      ));
      if (left < -(_deviceSize.width * 0.35) / 2 ||
          left > _deviceSize.width - ((_deviceSize.width * 0.35) / 2) ||
          top - kToolbarHeight < -(((_deviceSize.width * 0.35) * 1.7777) / 2) ||
          top + (((_deviceSize.width * 0.35) * 1.7777) / 2) >
              _deviceSize.height) {
        emit(state.copyWith(size: PIPSize.init(), mode: ModeType.none));
      }
    }
  }

  void onEndFloating(DragEndDetails details) {
    if (!state.isAnimated) {
      double dx =
          (state.size.left ?? 0) + (details.velocity.pixelsPerSecond.dx / 10);
      double dy =
          (state.size.top ?? 0) + (details.velocity.pixelsPerSecond.dy / 10);
      FloatingType position = FloatingType.leftTop;
      double left = dx + ((_deviceSize.width * 0.35) / 2);
      double top = (dy) + (((_deviceSize.width * 0.35) * 1.7777) / 2);
      if (left > _deviceSize.width / 2) {
        position = FloatingType.rightTop;
      }
      if (top > _deviceSize.height / 2) {
        position = position == FloatingType.leftTop
            ? FloatingType.leftBottom
            : FloatingType.rightBottom;
      }
      showFloating(position, duration: _duration ~/ 2);
    }
  }

  void showFloating(FloatingType type, {int? duration}) {
    if (!state.isAnimated) {
      PIPSize size = PIPSize.floating(_deviceSize, duration ?? 0, type);
      emit(state.copyWith(
        isAnimated: true,
        size: size,
        mode: ModeType.floating,
        cacheFloating: size,
      ));
      _endAnimation();
    }
  }

  void openPage() {
    if (!state.isAnimated) {
      emit(state.copyWith(size: PIPSize.bottomPosition(_deviceSize, 0)));
      Future.delayed(const Duration(milliseconds: 10), () {
        emit(state.copyWith(
          isAnimated: true,
          size: PIPSize.page(_deviceSize, _duration),
          mode: ModeType.page,
        ));
        _endAnimation(changeSize: PIPSize.topPosition(_deviceSize, 0));
      });
    }
  }

  void onFloatingToPage() {
    if (!state.isAnimated) {
      emit(state.copyWith(
        isAnimated: true,
        size: PIPSize.floatingToPage(_deviceSize, _duration, state.size),
        mode: ModeType.page,
      ));
      _endAnimation(changeSize: PIPSize.topPosition(_deviceSize, 0));
    }
  }

  void onPageToFloating(DragEndDetails details) {
    if (!state.isAnimated) {
      if (details.velocity.pixelsPerSecond.dy > 0) {
        emit(state.copyWith(
          isAnimated: true,
          size: PIPSize.pageToFloating(
              _deviceSize, _duration, state.cacheFloating),
          mode: ModeType.floating,
        ));
        _endAnimation();
      }
    }
  }

  void onClose() {
    if (!state.isAnimated) {
      emit(state.copyWith(
        isAnimated: true,
        size: PIPSize.bottomPosition(_deviceSize, _duration),
        mode: ModeType.none,
      ));
      _endAnimation();
    }
  }

  void _endAnimation({PIPSize? changeSize}) {
    Future.delayed(Duration(milliseconds: _duration), () {
      emit(state.copyWith(isAnimated: false, size: changeSize));
    });
  }

  void init(BuildContext context) => _deviceSize = Size(
      MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
}
