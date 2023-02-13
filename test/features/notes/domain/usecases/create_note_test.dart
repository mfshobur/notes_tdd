import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart';
import 'package:notes_tdd/features/notes/domain/usecases/create_note.dart';

import 'create_note_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NotesRepository>()])
void main() {
  late MockNotesRepository mockNotesRepository;
  late CreateNote usecase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    usecase = CreateNote(mockNotesRepository);
  });
  
  const tTitle = 'title';
  const tBody = 'body';
  final tTime = DateTime.now();
  const folder = null;

  test('should call create notes repository', () {
    // arrange
    when(mockNotesRepository.createNote(tTitle, tBody, tTime, folder))
        .thenReturn(null);
    // act
    usecase(CreateNoteParams(
        title: tTitle, body: tBody, lastEdit: tTime, folder: folder));
    // assert
    // expect(result, null);
    // result;
    verify(mockNotesRepository.createNote(tTitle, tBody, tTime, folder));
  });
}
