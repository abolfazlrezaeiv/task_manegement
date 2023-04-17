import 'package:task_management/domain/interface/entity.dart';

class Task extends Entity {
  final String title;
  final String description;
  bool isDone;

  Task({
    required this.title,
    required this.description,
    required this.isDone,
  });
}
