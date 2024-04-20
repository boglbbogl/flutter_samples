import 'package:custom_pip_sample/application/mode_cubit.dart';
import 'package:custom_pip_sample/application/mode_state.dart';
import 'package:custom_pip_sample/model/pip_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PIPWidget extends StatelessWidget {
  const PIPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit, ModeState>(
      builder: (context, state) {
        return AnimatedPositioned(
            top: state.size.top,
            left: state.size.left,
            duration: Duration(milliseconds: state.size.duration),
            child: GestureDetector(
              onTap: state.mode == ModeType.floating
                  ? () {
                      HapticFeedback.mediumImpact();
                      context.read<ModeCubit>().onFloatingToPage();
                    }
                  : null,
              onPanUpdate: state.mode == ModeType.floating
                  ? (DragUpdateDetails details) =>
                      context.read<ModeCubit>().onUpdateFloating(details)
                  : null,
              onPanEnd: state.mode == ModeType.floating
                  ? (DragEndDetails details) =>
                      context.read<ModeCubit>().onEndFloating(details)
                  : null,
              onVerticalDragEnd: state.mode == ModeType.page
                  ? (DragEndDetails details) {
                      context.read<ModeCubit>().onPageToFloating(details);
                    }
                  : null,
              child: AnimatedContainer(
                width: state.size.width,
                height: state.size.height,
                color: Colors.orange.withOpacity(0.5),
                duration: Duration(milliseconds: state.size.duration),
                child: Column(
                  children: [
                    if (state.mode == ModeType.page) ...[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        color: Colors.green.withOpacity(0.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                HapticFeedback.mediumImpact();
                                context.read<ModeCubit>().onClose();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 12),
                                  child: Icon(Icons.close)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ));
      },
    );
  }
}
