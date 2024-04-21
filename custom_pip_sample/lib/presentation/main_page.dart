import 'package:custom_pip_sample/application/mode_cubit.dart';
import 'package:custom_pip_sample/model/pip_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
            title: const Text(
              "Custom PIP Sample",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _title("Show PIP"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button(type: FloatingType.leftTop),
                    _button(type: FloatingType.rightTop),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button(type: FloatingType.leftBottom),
                    _button(type: FloatingType.rightBottom),
                  ],
                ),
                const SizedBox(height: 24),
                _title("Open Page"),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    context.read<ModeCubit>().openPage();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 40,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(116, 116, 116, 1),
                    ),
                    child: const Text(
                      "Open",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector _button({
    required FloatingType type,
  }) =>
      GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          context.read<ModeCubit>().showFloating(type);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: type == FloatingType.leftTop
                  ? const Radius.circular(8)
                  : Radius.zero,
              topRight: type == FloatingType.rightTop
                  ? const Radius.circular(8)
                  : Radius.zero,
              bottomLeft: type == FloatingType.leftBottom
                  ? const Radius.circular(8)
                  : Radius.zero,
              bottomRight: type == FloatingType.rightBottom
                  ? const Radius.circular(8)
                  : Radius.zero,
            ),
            color: const Color.fromRGBO(116, 116, 116, 1),
          ),
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: 80,
          alignment: Alignment.center,
          child: Text(
            type.code,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );

  Container _title(String title) => Container(
        height: 60,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(bottom: 12, left: 20),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
}
