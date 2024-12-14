import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todowithstatemanagment/Providers/TodoProvider.dart';

import 'ScreenADD.dart';

class ScreenOne extends ConsumerWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoproviderProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text(
            "Todo App",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final task = todoList[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              confirmDismiss: (direction) async {
                bool confirm = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black87,
                      title: const Text(
                        "Confirm Deletion",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      content: const Text(
                        "Are you sure you want to delete the task?",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text(
                            "Undo",
                            style:
                            TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text(
                            "Confirm",
                            style:
                            TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  },
                );
                if (confirm) {
                  ref.read(todoproviderProvider.notifier).removeTask(index);
                }
              },
              child: GestureDetector(
                onDoubleTap: () {
                  ref.read(todoproviderProvider.notifier).compTask(index);
                },
                child: SizedBox(
                  height: 140,
                  width: 400,
                  child: Card(
                    color: task.ColorCard,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 20,
                              color: task.isCompleted ? Colors.white24 : Colors.white,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            task.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: task.isCompleted ? Colors.white24 : Colors.grey,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 16,),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white38,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ScreenAdd()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}