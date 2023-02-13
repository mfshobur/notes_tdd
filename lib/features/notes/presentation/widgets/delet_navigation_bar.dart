import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/delete_notes_cubit.dart';

class DeleteNavigationBar extends StatelessWidget {
  const DeleteNavigationBar({
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
          return BottomNavigationBar(
            onTap: (value) {
              if (deleteCubit.lists.isEmpty) return;
              if (value == 1) {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: color.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Delete note',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Delete ${deleteCubit.lists.length} items?',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 42,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: color.background,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 42,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      deleteCubit.onDeleteNotes();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: color.onSecondary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24),
                                      ),
                                    ),
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
            unselectedItemColor: deleteCubit.lists.isNotEmpty
                ? color.onPrimary
                : color.onSurfaceVariant,
            selectedItemColor: deleteCubit.lists.isNotEmpty
                ? color.onPrimary
                : color.onSurfaceVariant,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.move_to_inbox,
                  color: deleteCubit.lists.isNotEmpty
                      ? color.onPrimary
                      : color.onSurfaceVariant,
                ),
                label: 'move to',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.delete,
                  color: deleteCubit.lists.isNotEmpty
                      ? color.onPrimary
                      : color.onSurfaceVariant,
                ),
                label: 'delete',
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}