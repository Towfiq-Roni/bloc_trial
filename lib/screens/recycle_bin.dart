import 'package:bloc_trial/Widgets/list_view.dart';
import 'package:bloc_trial/bloc/bloc_exports.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_state.dart';
import 'package:bloc_trial/screens/navigation_drawer.dart';
import 'package:flutter/material.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Trash'),
            actions: [
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                  icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete All Tasks')
                  ),
                onTap: () => context.read<TasksBloc>().add(DeleteAllTask()),
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
                    'Tasks: ${state.removedTasks.length}',
                  ),
                ),
              ),
              TasksList(tasksList: state.removedTasks),
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
      }
    );
  }
}
