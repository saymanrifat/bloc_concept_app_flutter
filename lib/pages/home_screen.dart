import 'package:bloc_app_flutter/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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

        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Internet Connected",
                ),
                backgroundColor: Colors.green,
              ));
            } else if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Internet Disconnected",
                ),
                backgroundColor: Colors.red,
              ));
            }
          },

          builder: (context, state) {
            if (state == InternetState.Gained) {
              return const Text("Connnected");
            } else if (state == InternetState.Lost) {
              return const Text("Not Connnected");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      )),
    );
  }
}
