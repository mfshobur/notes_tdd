import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Type call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateNoteParams extends Equatable {
  final String title;
  final String body;
  final DateTime lastEdit;
  final String? folder;

  const CreateNoteParams({
    required this.title,
    required this.body,
    required this.lastEdit,
    required this.folder,
  });

  @override
  List<Object?> get props => [title, body, lastEdit, folder];
}
