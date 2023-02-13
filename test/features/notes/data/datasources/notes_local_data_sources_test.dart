import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:notes_tdd/features/notes/domain/entities/notes.dart';
import 'package:uuid/uuid.dart';

import 'notes_local_data_sources_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box>(), MockSpec<Uuid>()])
void main() {
  late NotesLocalDataSourceImpl dataSource;
  late MockBox<Note> mockBox;
  late MockUuid mockUuid;

  setUp(() {
    mockBox = MockBox<Note>();
    mockUuid = MockUuid();
    dataSource = NotesLocalDataSourceImpl(box: mockBox, uuid: mockUuid);
  });
  const tTitle = 'title';
  const tBody = 'body';
  final tTime = DateTime.now();
  const folder = null;

  test('create new note in hive box', () {
    final id = mockUuid.v4();
    final tNote = Note(
      id: id,
      title: 'title',
      body: 'body',
      lastEdit: tTime,
      folder: folder,
    );
    // act
    dataSource.createNote(tTitle, tBody, tTime, folder);
    // assert
    verify(mockBox.put(tNote.id, tNote));
  });

  test('should delete note in hive box', () {
    List<String> tIdList = ['1', '3', '5'];
    dataSource.deleteNotes(tIdList);

    for (var i in tIdList) {
      verify(mockBox.delete(i));
    }
  });

  test('should get  box', () {

    expect(dataSource.getNotes(), const TypeMatcher<Box<Note>>());
  });

  const tNewTitle = 'title2';
  const tNewBody = 'body2';
  final tNewTime = DateTime.now();
  const newFolder = null;
  test('should update note in box', () {
    final id = mockUuid.v4();
    final tOldNote = Note(
      id: id,
      title: 'title',
      body: 'body',
      lastEdit: tTime,
      folder: folder,
    );
    final tNewNote = Note(
      id: tOldNote.id,
      title: tNewTitle,
      body: tNewBody,
      lastEdit: tNewTime,
      folder: newFolder,
    );
    dataSource.updateNote(id, tNewTitle, tNewBody, tNewTime, newFolder);
    verify(mockBox.delete(id));
    verify(mockBox.put(id, tNewNote));
    verifyNoMoreInteractions(mockBox);
  });
}
