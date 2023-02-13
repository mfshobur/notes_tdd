import 'package:equatable/equatable.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart';

class DeleteNotes extends UseCase<void, DeleteNotesParams> {
  final NotesRepository repository;

  DeleteNotes(this.repository);

  @override
  void call(params) {
    repository.deleteNotes(params.idList);
  }
}

class DeleteNotesParams extends Equatable {
  final List<String> idList;

  const DeleteNotesParams({required this.idList});

  @override
  List<Object?> get props => [idList];
}
