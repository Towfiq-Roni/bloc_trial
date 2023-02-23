import 'package:bloc_trial/models/tasks_model.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  List<Task> tasksList = [
    Task(title: 'Task 1'),
    Task(title: 'Task 2'),
    Task(title: 'Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          const Center(
            child: Chip(
              label: Text('Tasks: ',),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasksList.length,
                itemBuilder: (context, index){
                  var task = tasksList[index];
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {},
                ),
              );
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
