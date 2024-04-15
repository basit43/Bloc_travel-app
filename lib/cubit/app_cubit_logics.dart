import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  AppCubitLogicsState createState() => AppCubitLogicsState();
}

class AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return MainPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
