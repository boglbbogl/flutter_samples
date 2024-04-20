import 'package:custom_pip_sample/model/pip_type.dart';
import 'package:custom_pip_sample/model/pip_size.dart';
import 'package:equatable/equatable.dart';

class ModeState extends Equatable {
  final bool isAnimated;
  final ModeType mode;
  final PIPSize size;
  final PIPSize cacheFloating;
  const ModeState({
    this.isAnimated = false,
    this.mode = ModeType.none,
    required this.size,
    required this.cacheFloating,
  });

  @override
  List<Object?> get props => [isAnimated, mode, size, cacheFloating];

  ModeState copyWith({
    final bool? isAnimated,
    final ModeType? mode,
    final PIPSize? size,
    final PIPSize? cacheFloating,
  }) {
    return ModeState(
      isAnimated: isAnimated ?? this.isAnimated,
      mode: mode ?? this.mode,
      size: size ?? this.size,
      cacheFloating: cacheFloating ?? this.cacheFloating,
    );
  }
}
