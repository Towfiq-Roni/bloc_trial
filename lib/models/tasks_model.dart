// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  final String? description;
  final String id;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, this.description, required this.id, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
        title: title ?? this.title,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    id: map['id'] ?? '',
    isDone: map['isDone'],
    isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [title, description, id, isDone, isDeleted];
}
