import 'package:bloc_app_flutter/cubits/internet_cubit.dart';
import 'package:bloc_app_flutter/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        home: HomePages(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
