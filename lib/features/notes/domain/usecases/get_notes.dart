import 'package:hive/hive.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart';

import '../entities/notes.dart';

class GetNotes extends UseCase<Box<Note>, NoParams> {
  final NotesRepository repository;

  GetNotes(this.repository);
  @override
  Box<Note> call(NoParams params) {
    return repository.getNotes();
  }
}
