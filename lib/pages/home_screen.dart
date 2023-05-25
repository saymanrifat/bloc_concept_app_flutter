import 'package:bloc_app_flutter/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_app_flutter/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          // child: BlocBuilder<InternetBloc, InternetState>(
          //   builder: (context, state) {
          //     if (state is InternetGainedlState) {
          //       return Text("Connnected");
          //     } else if (state is InternetLostState) {
          //       return Text("Not Connnected");
          //     } else {
          //       return Text("Loading...");
          //     }
          //   },
          // ),
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedlState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Internet Connected",
                  ),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Internet Disconnected",
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is InternetGainedlState) {
                return Text("Connnected");
              } else if (state is InternetLostState) {
                return Text("Not Connnected");
              } else {
                return Text("Loading...");
              }
            },
          ),
        ),
      )),
    );
  }
}
