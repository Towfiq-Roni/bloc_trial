import 'package:bloc_trial/bloc/tasks_bloc/tasks_event.dart';
import 'package:bloc_trial/bloc/tasks_bloc/tasks_state.dart';
import 'package:bloc_trial/models/tasks_model.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<RemoveTask>(_onRemovedTask);
    on<DeleteTask>(_onDeleteTask);
    // on<OnTitleChanged>(_onTitleChangedEventToState);
    // on<OnDescriptionChanged>(_onDescriptionChangedEventToState);
    // on<OnIDGenerated>(_onIDGeneratedEventToState);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    // final int index = state.pendingTasks.indexOf(task);

    List<Task> pendingTasks = state.pendingTasks;
    // List.from(state.pendingTasks)..remove(task);
    List<Task> completedTasks = state.completedTasks;
    // List<Task> favoriteTasks = state.pendingTasks;

    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
            // pendingTasks.insert(0, task.copyWith(isDone: true)),
          }
        : {
      completedTasks = List.from(completedTasks)..remove(task),
      pendingTasks = List.from(pendingTasks)
        ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onRemovedTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
          pendingTasks: List.from(state.pendingTasks)..remove(event.task),
          completedTasks: List.from(state.completedTasks)..remove(event.task),
          favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
          removedTasks: List.from(state.removedTasks)
            ..add(event.task.copyWith(isDeleted: true))),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: List.from(state.removedTasks)..remove(event.task),
      // allTasks: List.from(state.allTasks)..remove(event.task)),
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }

  // void _onTitleChangedEventToState(OnTitleChanged event, Emitter<TasksState> emit){
  //   Task? task = Task();
  //   task.title = event.title;
  //   // task.copyWith(title: event.title);
  //   // emit(state);
  // }
  //
  // void _onDescriptionChangedEventToState(OnDescriptionChanged event, Emitter<TasksState> emit){
  //   Task? task = Task();
  //   task.description = event.description;
  //   // task.copyWith(description: event.description);
  //   // emit(state);
  // }
  //
  // void _onIDGeneratedEventToState(OnIDGenerated event, Emitter<TasksState> emit){
  //   Task? task = Task();
  //   task.id = event.id;
  //   // task.copyWith(id: event.id);
  //   // emit(state);
  // }
}
