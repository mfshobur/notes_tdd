import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/delete_notes_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.deleteCubit,
    required this.color,
  }) : super(key: key);

  final DeleteNotesCubit deleteCubit;
  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteNotesCubit, DeleteNotesState>(
      builder: (context, state) {
        if (state is DeleteNotesFilled) {
          return WillPopScope(
            onWillPop: () async {
              deleteCubit.onEmptyNotes();
              return false;
            },
            child: AppBar(
              centerTitle: true,
              backgroundColor: color.background,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  deleteCubit.onEmptyNotes();
                },
                icon: const Icon(Icons.close),
              ),
              title: deleteCubit.lists.isNotEmpty
                  ? Text('${deleteCubit.lists.length} items selected')
                  : const Text('Select items'),
            ),
          );
        }
        return AppBar(
          backgroundColor: color.background,
          elevation: 0.0,
          title: const Text('Notes'),
        );
      },
    );
  }
}