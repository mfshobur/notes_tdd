import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/notes.dart';

abstract class NotesLocalDataSource {
  void createNote(
      String title, String body, DateTime lastEdit, String? folder);
  Box<Note> getNotes();
  void updateNote(String id, String title, String body, DateTime lastEdit,
      String? folder);
  void deleteNotes(List<String> idList);
}

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  final Box<Note> box;
  final Uuid uuid;

  NotesLocalDataSourceImpl({required this.box, required this.uuid});

  @override
  void createNote(
      String title, String body, DateTime lastEdit, String? folder) {
    Note newNote = Note(
      id: uuid.v4(),
      title: title,
      body: body,
      lastEdit: lastEdit,
      folder: folder,
    );
    box.put(newNote.id, newNote);
  }

  @override
  void deleteNotes(List<String> idList) {
    for (var id in idList) {
      box.delete(id);
    }
  }

  @override
  Box<Note> getNotes() {
    return box;
  }

  @override
  void updateNote(String id, String title, String body, DateTime lastEdit,
      String? folder) {
    final updatedNote = Note(
      id: id,
      title: title,
      body: body,
      lastEdit: lastEdit,
      folder: folder,
    );
    box.delete(id);
    box.put(id, updatedNote);
  }
}
