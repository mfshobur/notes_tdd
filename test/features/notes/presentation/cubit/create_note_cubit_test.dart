import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/core/usecases/usecase.dart';
import 'package:notes_tdd/features/notes/domain/usecases/create_note.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/create_note_cubit.dart';

import 'create_note_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CreateNote>()])
void main() {
  late MockCreateNote mockCreateNote;
  late CreateNoteCubit cubit;

  setUp(() {
    mockCreateNote = MockCreateNote();
    cubit = CreateNoteCubit(mockCreateNote);
  });

  const title = 'title';
  const body = 'body';
  final lastEdit = DateTime.now();
  const folder = null;

  test('should run create note usecase', () {
    // act
    cubit.onCreateNote(title, body, lastEdit, folder);

    // assert
    verify(mockCreateNote(CreateNoteParams(
        title: title, body: body, lastEdit: lastEdit, folder: folder)));
  });
}
