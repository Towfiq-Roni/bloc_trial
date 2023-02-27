import 'package:bloc_trial/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      subtitle:
      task.isDeleted == false
      ? IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            _removeOrDeleteTask(context, task);
          })
      : null,
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<TasksBloc>().add(DeleteTask(task: task));
        },
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }
            : null,
      ),
    );
  }
}
