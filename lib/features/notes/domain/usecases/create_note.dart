import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart';

class CreateNote extends UseCase<void, CreateNoteParams> {
  final NotesRepository repository;

  CreateNote(this.repository);
  @override
  void call(CreateNoteParams params) {
    repository.createNote(
        params.title, params.body, params.lastEdit, params.folder);
  }
}

