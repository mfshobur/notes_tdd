import 'package:equatable/equatable.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart';

class UpdateNote extends UseCase<void, UpdateNoteParams> {
  final NotesRepository repository;

  UpdateNote(this.repository);

  @override
  void call(UpdateNoteParams params) {
    repository.updateNote(params.id,
        params.title, params.body, params.lastEdit, params.folder);
  }
}

class UpdateNoteParams extends Equatable {
  final String id;
  final String title;
  final String body;
  final DateTime lastEdit;
  final String? folder;

  const UpdateNoteParams({
    required this.id,
    required this.title,
    required this.body,
    required this.lastEdit,
    required this.folder,
  });

  @override
  List<Object?> get props => [title, body, lastEdit, folder];
}
