import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/bloc/task_bloc.dart';
import 'package:task_management/bloc/task_bloc.dart';
import 'package:task_management/util/paddings.dart';
import 'package:task_management/util/strings.dart';

class HomeTaskScreen extends StatelessWidget {
  const HomeTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(AppString.HOME_APPBAR_TITLE),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppString.ADD_TASK_SCREEN_ROOT_NAME);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskLoadState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onDoubleTap: () {
                  context.read<TaskBloc>().add(
                        MarkTaskAsCompletedButtonPressed(taskIndex: index),
                      );
                },
                child: Card(
                  color: state.tasks[index].isDone ? Colors.red : Colors.white,
                  child: Padding(
                    padding: AppPadding.ALL_20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.tasks[index].title),
                        const SizedBox(height: 20),
                        Text(state.tasks[index].description),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
