part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddTaskButtonPressed extends TaskEvent {
  final String taskTitle;
  final String taskDesc;
  AddTaskButtonPressed({
    required this.taskTitle,
    required this.taskDesc,
  });
}

class MarkTaskAsCompletedButtonPressed extends TaskEvent {
  final int taskIndex;

  MarkTaskAsCompletedButtonPressed({required this.taskIndex});
}
