part of 'create_note_cubit.dart';

abstract class CreateNoteState extends Equatable {
  const CreateNoteState();

  @override
  List<Object> get props => [];
}

class CreateNoteInitial extends CreateNoteState {}

class CreateNoteLoading extends CreateNoteState {}

class CreateNoteSuccess extends CreateNoteState {}
