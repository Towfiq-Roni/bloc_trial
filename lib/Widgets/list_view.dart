import 'package:bloc_trial/Widgets/task_tile.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key, required this.tasksList}) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: tasksList.map((task) => ExpansionPanelRadio(
          value: task.id,
          headerBuilder: (context, isOpen) => TaskTile(task: task),
          body: Container(
            padding: const EdgeInsets.only(bottom: 8),
              child:
                  task.description!.isNotEmpty
              ? Text(task.description!)
                      : const Text("Such Empty! HUH!!!"),
      ))).toList(),
    );
    //   Expanded(
    //   child: ListView.builder(
    //       itemCount: tasksList.length,
    //       itemBuilder: (context, index) {
    //         var task = tasksList[index];
    //         return TaskTile(task: task);
    //       }),
    // );
  }
}
