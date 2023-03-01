import 'package:bloc_trial/bloc/bloc_exports.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/models/tasks_model.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback favoriteOrUnFavoriteCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopUpMenu(
      {Key? key,
      required this.cancelOrDeleteCallback,
      required this.favoriteOrUnFavoriteCallback,
      required this.editTaskCallback,
      required this.restoreTaskCallback,
      required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    onTap: editTaskCallback,
                    child:
            // Row(
            //           children: const [
            //             Icon(Icons.edit),
            //             Text('Edit'),
            //           ],
            //         )
                    TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: favoriteOrUnFavoriteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove),
                      label: task.isFavorite == false
                          ? const Text('Add to Bookmark')
                          : const Text('Remove from Bookmark'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete')),
                    //     () {
                    //   _removeOrDeleteTask(context, task);
                    // },
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    onTap: restoreTaskCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore),
                      label: const Text('Restore'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Permanently')),
                    //     () {
                    //   _removeOrDeleteTask(context, task);
                    // },
                  ),
                ]);
  }
}
