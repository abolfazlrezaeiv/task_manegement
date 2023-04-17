import 'package:flutter/material.dart';
import 'package:task_management/bloc/task_bloc.dart';
import 'package:task_management/presentation/add_task_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/presentation/home_screen.dart';
import 'package:task_management/util/strings.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        home: const HomeTaskScreen(),
        initialRoute: AppString.HOME_SCREEN_ROUTE_NAME,
        routes: {
          AppString.HOME_SCREEN_ROUTE_NAME: (context) => const HomeTaskScreen(),
          AppString.ADD_TASK_SCREEN_ROOT_NAME: (context) => AddTaskScreen()
        },
      ),
    ),
  );
}
