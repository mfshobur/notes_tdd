import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/entities/notes.dart';
import 'package:notes_tdd/features/notes/domain/usecases/get_notes.dart';

import '../../data/datasources/notes_local_data_sources_test.mocks.dart';
import 'create_note_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box<Note>>()])
void main() {
  late MockNotesRepository mockNotesRepository;
  late MockBox<Note> box;
  late GetNotes usecase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    usecase = GetNotes(mockNotesRepository);
    box = MockBox<Note>();
  });

  test('should return box', () {
    when(mockNotesRepository.getNotes()).thenReturn(box);

    final result = usecase(NoParams());

    expect(result, box);
    verify(mockNotesRepository.getNotes());
    verifyNoMoreInteractions(mockNotesRepository);
  });
}
