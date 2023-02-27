import 'package:bloc_trial/bloc/bloc_exports.dart';
import 'package:bloc_trial/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_trial/bloc/switch_bloc/switch_state.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_state.dart';
import 'package:bloc_trial/screens/recycle_bin.dart';
import 'package:bloc_trial/screens/tabs_screen.dart';
import 'package:bloc_trial/screens/pending_tasks_screen.dart';
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
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.pendingTasks.length}'),
                ),
              );
            }),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Trash'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            }),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            }),
          ],
        ),
      ),
    );
  }
}
