import 'package:hive/hive.dart';

import '../entities/notes.dart';


abstract class NotesRepository {
  void createNote(
      String title, String body, DateTime lastEdit, String? folder);
  // Future<LazyBox<Note>> getNotes();
  Box<Note> getNotes();
  void updateNote(String id,
      String title, String body, DateTime lastEdit, String? folder);
  void deleteNotes(List<String> idList);
}
