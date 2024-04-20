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
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "Custom PIP Sample",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context
                            .read<ModeCubit>()
                            .showFloating(FloatingType.leftTop);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        color: Colors.amber,
                        child: Text("Show Floating (1/4)"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context
                            .read<ModeCubit>()
                            .showFloating(FloatingType.rightTop);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        color: Colors.amber,
                        child: Text("Show Floating (2/4)"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context
                            .read<ModeCubit>()
                            .showFloating(FloatingType.rightBottom);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        color: Colors.amber,
                        child: Text("Show Floating (3/4)"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context
                            .read<ModeCubit>()
                            .showFloating(FloatingType.leftBottom);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        color: Colors.amber,
                        child: Text("Show Floating(4/4)"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context.read<ModeCubit>().openPage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        color: Colors.amber,
                        child: Text("Open Page"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
