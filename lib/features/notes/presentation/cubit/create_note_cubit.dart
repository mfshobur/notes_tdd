import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/usecases/create_note.dart';

part 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  final CreateNote _createNote;
  CreateNoteCubit(this._createNote) : super(CreateNoteInitial());

  void onCreateNote(
    String title,
    String body,
    DateTime lastEdit,
    String? folder,
  ) {
    // emit(CreateNoteLoading());
    _createNote(CreateNoteParams(
        title: title, body: body, lastEdit: lastEdit, folder: folder));
  }
}
