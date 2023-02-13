import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_tdd/features/notes/domain/usecases/update_note.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/update_note_cubit.dart';

import 'update_note_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UpdateNote>()])
void main() {
  late MockUpdateNote mockUpdateNote;
  late UpdateNoteCubit cubit;

  setUp(() {
    mockUpdateNote = MockUpdateNote();
    cubit = UpdateNoteCubit(mockUpdateNote);
  });

  const id = '1';
  const title = 'title';
  const body = 'body';
  final lastEdit = DateTime.now();
  const folder = null;
  test('should run update note usecase', () {
    // act
    cubit.onUpdateNote(id, title, body, lastEdit, folder);
    // assert
    verify(mockUpdateNote(UpdateNoteParams(
      id: id,
      title: title,
      body: body,
      lastEdit: lastEdit,
      folder: folder,
    )));
  });
}
