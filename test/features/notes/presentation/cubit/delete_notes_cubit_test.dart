import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/features/notes/domain/usecases/delete_notes.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/delete_notes_cubit.dart';

import 'delete_notes_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DeleteNotes>()])
void main() {
  late MockDeleteNotes mockDeleteNotes;
  late DeleteNotesCubit cubit;

  setUp(() {
    mockDeleteNotes = MockDeleteNotes();
    cubit = DeleteNotesCubit(mockDeleteNotes);
  });

  group('delete notes', () {
    test('should add note id to list', () {
      final result = ['3', '5'];

      cubit.onAddNotes('3');
      cubit.onAddNotes('5');

      expectLater(cubit.lists, result);
    });
    test('should empty lists when delete notes', () {
      cubit.onAddNotes('1');
      cubit.onAddNotes('3');
      cubit.onAddNotes('5');
      cubit.onDeleteNotes();

      expectLater(cubit.lists, []);
    });

    test('should delete 1 id in list', () {
      expectLater(cubit.lists, []);

      cubit.onAddNotes('1');
      cubit.onDeleteNote('1');

      verify(mockDeleteNotes(const DeleteNotesParams(idList: ['1'])));
    });

    test('should remove id when inserted twice list', () {
      cubit.onAddNotes('1');
      cubit.onAddNotes('1');

      expectLater(cubit.lists, []);
    });
  });
}
