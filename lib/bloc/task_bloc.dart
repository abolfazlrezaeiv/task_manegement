import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/domain/entity/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskLoadState> {
  TaskBloc() : super(TaskLoadState(tasks: [])) {
    on<TaskEvent>((event, emit) {
      onAddButtonPressedEventHandler(event, emit);
      onMarkAsCompleteTaskEvent(event, emit);
    });
  }

  void onMarkAsCompleteTaskEvent(TaskEvent event, Emitter<TaskLoadState> emit) {
    if (event is MarkTaskAsCompletedButtonPressed) {
      state.tasks[event.taskIndex].isDone =
          !state.tasks[event.taskIndex].isDone;
      emit(state.copyWith(tasks: state.tasks));
    }
  }

  void onAddButtonPressedEventHandler(
      TaskEvent event, Emitter<TaskLoadState> emit) {
    if (event is AddTaskButtonPressed) {
      state.tasks.add(Task(
          title: event.taskTitle, description: event.taskDesc, isDone: false));
      emit(state.copyWith(tasks: state.tasks));
    }
  }
}
