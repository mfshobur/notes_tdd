import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/usecases/get_notes.dart';

import '../../domain/entities/notes.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  final GetNotes _getNotes;
  GetNotesCubit(this._getNotes) : super(GetNotesInitial());

  void onGetNotes() {
    emit(GetNotesLoading());
    final box = _getNotes(NoParams());
    emit(GetNotesSuccess(box));
  }
}
