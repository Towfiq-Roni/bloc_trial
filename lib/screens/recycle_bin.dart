import 'package:bloc_trial/Widgets/list_view.dart';
import 'package:bloc_trial/screens/navigation_drawer.dart';
import 'package:flutter/material.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const NavigateDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Chip(
              label: Text(
                'Tasks: 0',
              ),
            ),
          ),
          TasksList(tasksList: []),
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
}
