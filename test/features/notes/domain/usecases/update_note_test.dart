import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/features/notes/domain/usecases/update_note.dart';

import 'create_note_test.mocks.dart';

void main() {
  late MockNotesRepository mockNotesRepository;
  late UpdateNote usecase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    usecase = UpdateNote(mockNotesRepository);
  });

  const tTitle = 'title';
  const tBody = 'body';
  final tTime = DateTime.now();
  const folder = null;
  const id = '1';
  test('should run update note in repository', () {
    when(mockNotesRepository.updateNote(id, tTitle, tBody, tTime, folder))
        .thenReturn(null);

    usecase(UpdateNoteParams(id: id,
        title: tTitle, body: tBody, lastEdit: tTime, folder: folder));

    verify(mockNotesRepository.updateNote(id, tTitle, tBody, tTime, folder));
    verifyNoMoreInteractions(mockNotesRepository);
  });
}
