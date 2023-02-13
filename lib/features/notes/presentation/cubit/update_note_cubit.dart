import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_tdd/features/notes/domain/usecases/update_note.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  final UpdateNote _updateNote;
  UpdateNoteCubit(this._updateNote) : super(UpdateNoteInitial());

  void onUpdateNote(
    String id,
    String title,
    String body,
    DateTime lastEdit,
    String? folder,
  ) {
    _updateNote(UpdateNoteParams(
      id: id,
      title: title,
      body: body,
      lastEdit: lastEdit,
      folder: folder,
    ));
  }
}
