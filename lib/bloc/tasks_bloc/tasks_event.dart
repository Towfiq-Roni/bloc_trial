import 'package:bloc_trial/models/tasks_model.dart';
import 'package:equatable/equatable.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

// class OnTitleChanged extends TasksEvent{
//   final String? title;
//
//   const OnTitleChanged({required this.title,});
//
//   @override
//   List<Object?> get props => [title];
// }
//
// class OnDescriptionChanged extends TasksEvent{
//   final String? description;
//
//   const OnDescriptionChanged({required this.description,});
//
//   @override
//   List<Object?> get props => [description];
// }
//
// class OnIDGenerated extends TasksEvent{
//   final String? id;
//
//   const OnIDGenerated({required this.id,});
//
//   @override
//   List<Object?> get props => [id];
// }

class UpdateTask extends TasksEvent {
  final Task task;

  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TasksEvent {
  final Task task;

  const RemoveTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}







