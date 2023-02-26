import 'package:bloc_trial/Widgets/list_view.dart';

// import 'package:bloc_trial/bloc/bloc_exports.dart';
import 'package:bloc_trial/bloc/tasks_bloc.dart';
import 'package:bloc_trial/bloc/tasks_event.dart';
import 'package:bloc_trial/bloc/tasks_state.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:bloc_trial/screens/add_task_screen.dart';
import 'package:bloc_trial/screens/navigation_drawer.dart';

// import 'package:bloc_trial/models/tasks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // TextEditingController titleController = TextEditingController();

  // List<Task> tasksList = [
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  // @override
  // void dispose(){
  //   titleController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.allTasks;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks App'),
          actions: [
            IconButton(
              onPressed: () {
                _addTask(context);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        drawer: const NavigateDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Chip(
                label: Text(
                  'Tasks: ${state.allTasks.length}',
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTask(context);
          },
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
