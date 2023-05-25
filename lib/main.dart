import 'package:bloc_app_flutter/blocs/internet_bloc/internet_bloc.dart';
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
      create: (context) => InternetBloc(),
      child: MaterialApp(
        home: HomePages(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
