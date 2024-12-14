import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todowithstatemanagment/ScreenOne.dart';

import 'Providers/TodoProvider.dart';

class ScreenAdd extends ConsumerStatefulWidget {
  const ScreenAdd({super.key});

  @override
  ConsumerState<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends ConsumerState<ScreenAdd> {
  late TextEditingController controllerTask;
  late TextEditingController controllerDes;
  @override
  void initState() {
    super.initState();
    controllerTask = TextEditingController();
    controllerDes = TextEditingController();
  }

  @override
  void dispose() {
    controllerTask.dispose();
    controllerDes.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text(
          "Add naw task",
          style: TextStyle(color: Colors.white70),
        )),
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 40,
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    controller: controllerTask,
                    decoration: InputDecoration(
                      hintText: "Task",
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal",
                          color: Colors.grey,
                          fontSize: 13),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 250,
                  height: 40,
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                      ),
                    controller: controllerDes,
                    decoration: InputDecoration(
                      hintText: "Descriptions",
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal",
                          color: Colors.grey,
                          fontSize: 13),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                      onPressed: () {
                        final taskTitle = controllerTask.text;
                        final taskDescription = controllerDes.text;
                        if (taskTitle.isNotEmpty &&
                            taskDescription.isNotEmpty) {
                          final taskId =
                              DateTime.now().millisecondsSinceEpoch.toString();
                              ref.read(todoproviderProvider.notifier).addTask(
                              taskId, taskTitle, taskDescription, false);
                          print("Task Added");
                          Navigator.pop(context);
                        }else {
                          print("Field");}

                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
