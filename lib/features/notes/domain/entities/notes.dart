// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 0)
class Note extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String body;
  @HiveField(3)
  final DateTime lastEdit;
  @HiveField(4)
  final String? folder;

  const Note({
    required this.id,
    required this.title,
    required this.body,
    required this.lastEdit,
    required this.folder,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      lastEdit: json['lastEdit'],
      folder: json['folder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'lastEdit': lastEdit,
      'folder': folder,
    };
  }

  @override
  List<Object?> get props => [title, body, lastEdit, folder];
}
