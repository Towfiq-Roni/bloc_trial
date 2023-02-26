import 'package:bloc_trial/bloc/bloc_exports.dart';
import 'package:bloc_trial/bloc/tasks_bloc.dart';
import 'package:bloc_trial/bloc/tasks_state.dart';
import 'package:bloc_trial/screens/recycle_bin.dart';
import 'package:bloc_trial/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class NavigateDrawer extends StatelessWidget {
  const NavigateDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.lightBlueAccent,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.allTasks.length}'),
                ),
              );
            }),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                child: const ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Trash'),
                  trailing: Text('0'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
