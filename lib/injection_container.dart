import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:notes_tdd/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:notes_tdd/features/notes/data/repository/notes_repository_impl.dart';
import 'package:notes_tdd/features/notes/domain/entities/notes.dart';
import 'package:notes_tdd/features/notes/domain/repository/notes_repository.dart';
import 'package:notes_tdd/features/notes/domain/usecases/get_notes.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/get_notes_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'features/notes/domain/usecases/create_note.dart';
import 'features/notes/domain/usecases/delete_notes.dart';
import 'features/notes/domain/usecases/update_note.dart';
import 'features/notes/presentation/cubit/create_note_cubit.dart';
import 'features/notes/presentation/cubit/delete_notes_cubit.dart';
import 'features/notes/presentation/cubit/update_note_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // cubit
  sl.registerFactory(() => GetNotesCubit(sl()));
  sl.registerFactory(() => UpdateNoteCubit(sl()));
  sl.registerFactory(() => CreateNoteCubit(sl()));
  sl.registerFactory(() => DeleteNotesCubit(sl()));

  // use cases
  sl.registerLazySingleton(() => GetNotes(sl()));
  sl.registerLazySingleton(() => DeleteNotes(sl()));
  sl.registerLazySingleton(() => UpdateNote(sl()));
  sl.registerLazySingleton(() => CreateNote(sl()));

  // repository
  sl.registerLazySingleton<NotesRepository>(() => NotesRepositoryImpl(sl()));
  Hive.registerAdapter(NoteAdapter());
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.deleteBoxFromDisk('notes');
  final box = await Hive.openBox<Note>('notes');
  sl.registerLazySingleton(() => box);
  sl.registerLazySingleton(() => const Uuid());

  // data source
  sl.registerLazySingleton<NotesLocalDataSource>(
    () => NotesLocalDataSourceImpl(
      box: sl(),
      uuid: sl(),
    ),
  );
}
