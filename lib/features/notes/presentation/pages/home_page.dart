import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/delete_notes_cubit.dart';
import '../../domain/entities/notes.dart';
import '../cubit/get_notes_cubit.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/delet_navigation_bar.dart';
import '../widgets/note_thumbnail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notesToDelete = [];
  @override
  void initState() {
    context.read<GetNotesCubit>().onGetNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    final deleteCubit = context.read<DeleteNotesCubit>();
    final stream = deleteCubit.listStream?.listen((event) {
      setState(() {});
    });

    return Scaffold(
      backgroundColor: color.background,
      bottomNavigationBar: DeleteNavigationBar(deleteCubit: deleteCubit, color: color),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(deleteCubit: deleteCubit, color: color),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const CustomFloatingActionButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<GetNotesCubit, GetNotesState>(
            builder: (context, state) {
              if (state is GetNotesSuccess) {
                return ValueListenableBuilder(
                  valueListenable: state.box.listenable(),
                  builder: (context, value, child) {
                    if (value.isNotEmpty) {
                      List<Note> notes = value.values.toList();
                      notes.sort(((a, b) => b.lastEdit.compareTo(a.lastEdit))); // sort based on latest edit
                      return StaggeredGrid.count(
                        crossAxisCount: 2,
                        axisDirection: AxisDirection.down,
                        children: notes.map((note) {
                          bool isSelected = false;
                          return NoteThumbnail(
                            note: note,
                            color: color,
                            isSelected: isSelected,
                          );
                        }).toList(),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: Text(
                            'Lets create new note!',
                            style: TextStyle(
                              fontSize: 18,
                              color: color.onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}






