import 'package:bloc_trial/Widgets/popup_menu_button.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:bloc_trial/screens/edit_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: EditTaskScreen(oldTask: task,),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(children: [
              task.isFavorite == false || task.isDeleted == true
                  ? const Icon(Icons.star_outline)
                  : const Icon(Icons.star),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      decoration:
                          task.isDone! ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(DateFormat()
                      .add_yMMMd()
                      .add_Hms()
                      .format(DateTime.parse(task.date))),
                ],
              )),
            ]),
          ),
          Row(children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TasksBloc>().add(UpdateTask(task: task));
                    }
                  : null,
            ),
            PopUpMenu(
              cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
              task: task,
              favoriteOrUnFavoriteCallback: () => context
                  .read<TasksBloc>()
                  .add(FavoriteOrUnFavoriteTask(task: task)),
              editTaskCallback: () {
                /// showModalBottomSheet executes Navigator.of(context).pop()
                /// as soon as the callback happens, so delay it to delay the
                /// pop()
                Future.delayed(
                    Duration.zero,
                        () => _editTask(context)
                );
                /// or do this to so when it executes pop() once and show the
                /// showModalBottomSheet again after the first one
                /// (this method is not good at all)
                // _editTask(context);
                // _editTask(context);
                }, restoreTaskCallback: () => context.read<TasksBloc>().add(RestoreTask(task: task)),
            ),
          ]),
        ],
      ),
    );
    //   ListTile(
    //   title: Text(
    //     task.title,
    //     overflow: TextOverflow.ellipsis,
    //     style: TextStyle(
    //         decoration: task.isDone! ? TextDecoration.lineThrough : null),
    //   ),
    //   subtitle:
    //   task.isDeleted == false
    //   ? IconButton(
    //       icon: Icon(Icons.remove),
    //       onPressed: () {
    //         _removeOrDeleteTask(context, task);
    //       })
    //   : null,
    //   leading: IconButton(
    //     icon: const Icon(Icons.delete),
    //     onPressed: () {
    //       context.read<TasksBloc>().add(DeleteTask(task: task));
    //     },
    //   ),
    //   trailing: Checkbox(
    //     value: task.isDone,
    //     onChanged: task.isDeleted == false
    //         ? (value) {
    //             context.read<TasksBloc>().add(UpdateTask(task: task));
    //           }
    //         : null,
    //   ),
    // );
  }
}
