import 'package:notes_tdd/features/notes/domain/entities/notes.dart';

class NoteModel extends Note {
  const NoteModel({
    required super.id,
    required super.title,
    required super.body,
    required super.lastEdit,
    required super.folder,
  });
}
