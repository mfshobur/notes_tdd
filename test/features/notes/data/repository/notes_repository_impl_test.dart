import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:notes_tdd/features/notes/data/repository/notes_repository_impl.dart';
import 'package:notes_tdd/features/notes/domain/entities/notes.dart';

import '../datasources/notes_local_data_sources_test.mocks.dart';
import 'notes_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NotesLocalDataSource>()])
void main() {
  late NotesRepositoryImpl repository;
  late MockNotesLocalDataSource mockLocalDataSource;
  late MockBox<Note> box;

  setUp(() {
    mockLocalDataSource = MockNotesLocalDataSource();
    repository = NotesRepositoryImpl(mockLocalDataSource);
    box = MockBox<Note>();
  });

  const tTitle = 'title';
  const tBody = 'body';
  final tTime = DateTime.now();
  const folder = null;
  test('should create new note', () {
    repository.createNote(tTitle, tBody, tTime, folder);

    verify(mockLocalDataSource.createNote(tTitle, tBody, tTime, folder));
  });

  final tIdList = ['1', '3', '5'];
  test('should delete notes from local data source', () {
    repository.deleteNotes(tIdList);

    verify(mockLocalDataSource.deleteNotes(tIdList));
    verifyNoMoreInteractions(mockLocalDataSource);
  });

  test('should get box', () {
    when(mockLocalDataSource.getNotes()).thenReturn(box);

    final result = repository.getNotes();

    expect(result, box);
  });

  const tNewTitle = 'title2';
  const tNewBody = 'body2';
  final tNewTime = DateTime.now();
  const newFolder = null;

  test('should update notes', () {
    const id = '1';
    repository.updateNote(id, tNewTitle, tNewBody, tNewTime, newFolder);
    verify(mockLocalDataSource.updateNote(
        id, tNewTitle, tNewBody, tNewTime, newFolder));
  });
}
