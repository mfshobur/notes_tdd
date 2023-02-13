// Mocks generated by Mockito 5.3.2 from annotations
// in notes_tdd/test/features/notes/domain/usecases/create_note_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:hive/hive.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:notes_tdd/features/notes/domain/entities/notes.dart' as _i4;
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBox_0<E> extends _i1.SmartFake implements _i2.Box<E> {
  _FakeBox_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NotesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotesRepository extends _i1.Mock implements _i3.NotesRepository {
  @override
  void createNote(
    String? title,
    String? body,
    DateTime? lastEdit,
    String? folder,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #createNote,
          [
            title,
            body,
            lastEdit,
            folder,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Box<_i4.Note> getNotes() => (super.noSuchMethod(
        Invocation.method(
          #getNotes,
          [],
        ),
        returnValue: _FakeBox_0<_i4.Note>(
          this,
          Invocation.method(
            #getNotes,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeBox_0<_i4.Note>(
          this,
          Invocation.method(
            #getNotes,
            [],
          ),
        ),
      ) as _i2.Box<_i4.Note>);
  @override
  void updateNote(
    String? id,
    String? title,
    String? body,
    DateTime? lastEdit,
    String? folder,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #updateNote,
          [
            id,
            title,
            body,
            lastEdit,
            folder,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void deleteNotes(List<String>? idList) => super.noSuchMethod(
        Invocation.method(
          #deleteNotes,
          [idList],
        ),
        returnValueForMissingStub: null,
      );
}