import 'dart:ui';

class TodoTask {
  String id;
  String title;
  String description;
  bool isCompleted;
  Color ColorCard;

  TodoTask({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.ColorCard
  });
}