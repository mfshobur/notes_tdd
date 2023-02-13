import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_tdd/features/notes/domain/usecases/delete_notes.dart';

part 'delete_notes_state.dart';

class DeleteNotesCubit extends Cubit<DeleteNotesState> {
  final DeleteNotes _deleteNotes;
  List<String> lists = [];
  final _streamController = StreamController<int>();
  Stream<int>? listStream;
  StreamSubscription<int>? streamSubscription;
  DeleteNotesCubit(this._deleteNotes) : super(DeleteNotesEmpty());

  void onDeleteNotes() {
    _deleteNotes(DeleteNotesParams(idList: lists));
    lists.clear();
    emit(DeleteNotesEmpty());
  }

  void onDeleteNote(String id) {
    _deleteNotes(DeleteNotesParams(idList: [id]));
    lists.clear();
    emit(DeleteNotesEmpty());
  }

  void onAddNotes(String id) {
    listStream ??= _streamController.stream.asBroadcastStream();
    // check if the lists already contains the id
    if (lists.contains(id)) {
      // remove if present
      lists.remove(id);
    }
    // add if not present
    else {
      lists.add(id);
    }

    // check state
    if (lists.isNotEmpty) {
      emit(DeleteNotesFilled());
    }
    _streamController.add(lists.length);
  }

  void onEmptyNotes() {
    lists.clear();
    _streamController.add(lists.length);
    emit(DeleteNotesEmpty());
  }
}
