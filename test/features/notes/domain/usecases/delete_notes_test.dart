import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/features/notes/domain/usecases/delete_notes.dart';

import 'create_note_test.mocks.dart';

void main() {
  late MockNotesRepository mockNotesRepository;
  late DeleteNotes usecase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    usecase = DeleteNotes(mockNotesRepository);
  });

  final tIdList = ['1', '2', '3'];

  test('should run delete notes in repository', () {
    when(mockNotesRepository.deleteNotes(tIdList)).thenReturn(null);

    usecase(DeleteNotesParams(idList: tIdList));

    verify(mockNotesRepository.deleteNotes(tIdList));
    verifyNoMoreInteractions(mockNotesRepository);
  });
}
