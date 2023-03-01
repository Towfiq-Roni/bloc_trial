// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  final String? description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({required this.title, this.description,
    required this.id, this.isFavorite,
    required this.date, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
        title: title ?? this.title,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    id: map['id'] ?? '',
    date: map['date'],
    isDone: map['isDone'],
    isDeleted: map['isDeleted'],
    isFavorite: map['isFavorite'],
    );
  }

  @override
  List<Object?> get props => [title, description, id, date, isDone,
    isDeleted, isFavorite];
}
