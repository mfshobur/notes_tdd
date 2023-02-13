// Mocks generated by Mockito 5.3.2 from annotations
// in notes_tdd/test/features/notes/presentation/cubit/delete_notes_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart'
    as _i2;
import 'package:notes_tdd/features/notes/domain/usecases/delete_notes.dart'
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

class _FakeNotesRepository_0 extends _i1.SmartFake
    implements _i2.NotesRepository {
  _FakeNotesRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DeleteNotes].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteNotes extends _i1.Mock implements _i3.DeleteNotes {
  @override
  _i2.NotesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeNotesRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeNotesRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.NotesRepository);
  @override
  void call(_i3.DeleteNotesParams? params) => super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValueForMissingStub: null,
      );
}