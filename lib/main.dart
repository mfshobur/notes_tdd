import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_tdd/core/theme/theme.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/create_note_cubit.dart';
import 'package:notes_tdd/features/notes/presentation/pages/home_page.dart';
import 'features/notes/presentation/cubit/delete_notes_cubit.dart';
import 'features/notes/presentation/cubit/get_notes_cubit.dart';
import 'features/notes/presentation/cubit/update_note_cubit.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CreateNoteCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<GetNotesCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<UpdateNoteCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<DeleteNotesCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme().theme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
