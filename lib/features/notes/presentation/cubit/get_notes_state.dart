part of 'get_notes_cubit.dart';

abstract class GetNotesState extends Equatable {
  const GetNotesState();

  @override
  List<Object> get props => [];
}

class GetNotesInitial extends GetNotesState {}

class GetNotesLoading extends GetNotesState {}

class GetNotesSuccess extends GetNotesState {
  final Box<Note> box;

  const GetNotesSuccess(this.box);
}
