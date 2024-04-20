import 'package:custom_pip_sample/application/mode_cubit.dart';
import 'package:custom_pip_sample/presentation/main_page.dart';
import 'package:custom_pip_sample/presentation/pip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ModeCubit>(
      create: (_) => ModeCubit()..init(context),
      child: const MaterialApp(
        home: Stack(
          children: [
            MainPage(),
            PIPWidget(),
          ],
        ),
      ),
    );
  }
}
