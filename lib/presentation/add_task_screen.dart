import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/bloc/task_bloc.dart';
import 'package:task_management/util/strings.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  final _titleFieldController = TextEditingController();
  final _descriptionFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskLoadState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextField(
                controller: _titleFieldController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: AppString.TITLE_FIELD_LABEL,
                ),
              ),
              TextField(
                controller: _descriptionFieldController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: AppString.DESCRIPTION_FIELD_LABEL,
                ),
              ),
              const Spacer(),
              FilledButton(
                  onPressed: () {
                    context.read<TaskBloc>().add(AddTaskButtonPressed(
                        taskTitle: _titleFieldController.text,
                        taskDesc: _descriptionFieldController.text));
                    Navigator.pop(context);
                  },
                  child: const Text(AppString.SAVE_BUTTON_LABEL))
            ],
          ),
        );
      },
    );
  }
}
