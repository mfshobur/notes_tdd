part of 'delete_notes_cubit.dart';

abstract class DeleteNotesState extends Equatable {
  const DeleteNotesState();

  @override
  List<Object> get props => [];
}

class DeleteNotesEmpty extends DeleteNotesState {}

class DeleteNotesFilled extends DeleteNotesState {}

class DeleteNotesSuccess extends DeleteNotesState {}
