import 'package:bloc_trial/Widgets/list_view.dart';

import 'package:bloc_trial/bloc/bloc_exports.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_state.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:bloc_trial/screens/add_task_screen.dart';
import 'package:bloc_trial/screens/navigation_drawer.dart';

// import 'package:bloc_trial/models/tasks_model.dart';
import 'package:flutter/material.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  // TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.favoriteTasks;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Chip(
                label: Text(
                  'Tasks: ${tasksList.length}',
                ),
              ),
            ),
            TasksList(tasksList: tasksList),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: tasksList.length,
            //       itemBuilder: (context, index){
            //         var task = tasksList[index];
            //     return ListTile(
            //       title: Text(task.title),
            //       trailing: Checkbox(
            //         value: task.isDone,
            //         onChanged: (value) {},
            //       ),
            //     );
            //   }),
            // )
          ],
        ),
      );
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _addTask(context);
      //   },
      //   tooltip: 'Add Task',
      //   child: const Icon(Icons.add),
      // ),
    });
  }
}
