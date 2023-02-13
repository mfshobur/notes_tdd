import 'package:hive/hive.dart';
import 'package:notes_tdd/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart';

import '../../domain/entities/notes.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDataSource _localDataSource;

  NotesRepositoryImpl(this._localDataSource);

  @override
  void createNote(
      String title, String body, DateTime lastEdit, String? folder) {
    _localDataSource.createNote(title, body, lastEdit, folder);
  }

  @override
  void deleteNotes(List<String> idList) {
    _localDataSource.deleteNotes(idList);
  }

  @override
  Box<Note> getNotes() {
    return _localDataSource.getNotes();
  }

  @override
  void updateNote(String id, String title, String body, DateTime lastEdit,
      String? folder) {
    _localDataSource.updateNote(id, title, body, lastEdit, folder);
  }
}
