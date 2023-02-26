import 'package:bloc_trial/bloc/tasks_bloc.dart';
import 'package:bloc_trial/bloc/tasks_event.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough:null
      ),),
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          context.read<TasksBloc>().add(DeleteTask(task: task));
        },
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
      ),
    );
  }
}
