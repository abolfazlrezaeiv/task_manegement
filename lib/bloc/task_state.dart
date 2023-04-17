part of 'task_bloc.dart';

class TaskLoadState {
  List<Task> tasks;

  TaskLoadState({required this.tasks});

  TaskLoadState copyWith({
    List<Task>? tasks,
  }) {
    return TaskLoadState(
      tasks: tasks ?? this.tasks,
    );
  }
}
