import 'package:bloc_trial/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:bloc_trial/services/guid_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    String? title;
    String? description;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (text){
              // context.read<TasksBloc>().add(OnTitleChanged(title: text));
              // context.read<Task>().title;
              title = text;
            },
            autofocus: true,
            // controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          const Divider(),
          TextField(
            onChanged: (text){
              // context.read<TasksBloc>().add(OnDescriptionChanged(description: text));
              // context.read<Task>().description;
              description = text;
            },
            autofocus: true,
            // controller: descriptionController,
            minLines: 2,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')
              ),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                        // title: titleController.text,
                        title: title!,
                      id: GuidGen.generate(),
                      // description: descriptionController.text,
                      description: description,
                    );
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
