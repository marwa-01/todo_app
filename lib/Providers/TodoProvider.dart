import 'dart:math';
import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../TodoTask.dart';

part 'TodoProvider.g.dart';


@riverpod
class Todoprovider extends _$Todoprovider {
  @override
  List<TodoTask> build() {
    return [];
  }


  void addTask(String id, String title, String des, bool isComplete) {

    final randomColor =  Color(Random().nextInt(0xffffffff));

    state = [
      ...state,
      TodoTask(id: id, title: title, description: des, isCompleted: isComplete, ColorCard: randomColor),
    ];
  }


  void removeTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  void compTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          TodoTask(
            id: state[i].id,
            title: state[i].title,
            description: state[i].description,
            isCompleted: !state[i].isCompleted,
            ColorCard: state[i].ColorCard
          )
        else
          state[i],
    ];
  }
}
