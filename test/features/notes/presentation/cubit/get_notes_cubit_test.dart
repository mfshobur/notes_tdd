import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/entities/notes.dart';
import 'package:notes_tdd/features/notes/domain/usecases/get_notes.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/get_notes_cubit.dart';

import '../../data/datasources/notes_local_data_sources_test.mocks.dart';
import 'get_notes_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetNotes>()])
void main() {
  late GetNotesCubit cubit;
  late MockGetNotes mockGetNotes;
  late MockBox<Note> mockBox;

  setUp(() {
    mockGetNotes = MockGetNotes();
    cubit = GetNotesCubit(mockGetNotes);
    mockBox = MockBox<Note>();
  });

  group('get notes', () {
    test('should get box', () {
      when(mockGetNotes(any)).thenReturn(mockBox);

      cubit.onGetNotes();
      untilCalled(mockGetNotes(any));

      verify(mockGetNotes(any));
    });

    test('should emit [Loading, Success] when box is gotten successfully',
        () async {
      // arrange
      when(mockGetNotes(NoParams())).thenReturn(mockBox);
      final expected = [
        GetNotesLoading(),
        GetNotesSuccess(mockBox),
      ];

      // assert later

      expectLater(cubit.stream, emitsInOrder(expected));

      // act
      cubit.onGetNotes();
      verify(mockGetNotes(NoParams()));
    });
  });
}
