import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_tdd/core/dateformat/date_format.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/delete_notes_cubit.dart';
import 'package:notes_tdd/features/notes/presentation/pages/note_page.dart';

import '../../domain/entities/notes.dart';

class NoteThumbnail extends StatefulWidget {
  final Note note;
  final ColorScheme color;
  bool isSelected;
  NoteThumbnail({
    Key? key,
    required this.color,
    required this.note,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<NoteThumbnail> createState() => _NoteThumbnailState();
}

class _NoteThumbnailState extends State<NoteThumbnail> {
  double padding = 8.0;
  @override
  Widget build(BuildContext context) {
    final deleteCubit = context.read<DeleteNotesCubit>();
    return GestureDetector(
      onTap: () {
        if (deleteCubit.state == DeleteNotesEmpty()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotePage(note: widget.note),
            ),
          );
        } else {
          deleteCubit.onAddNotes(widget.note.id);
        }
      },
      onTapDown: (details) {
        setState(() {
          padding = 12.0;
        });
      },
      onTapUp: (details) {
        setState(() {
          padding = 8.0;
        });
      },
      onTapCancel: () {
        setState(() {
          padding = 8.0;
        });
      },
      onLongPressCancel: () {
        setState(() {
          padding = 8.0;
        });
      },
      onLongPress: () {
        HapticFeedback.heavyImpact();
        deleteCubit.onAddNotes(widget.note.id);
      },
      onLongPressDown: (details) {
        setState(() {
          padding = 12.0;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          padding = 8.0;
        });
      },
      onLongPressMoveUpdate: (details) {
        setState(() {
          padding = 8.0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const  EdgeInsets.all(0),
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.all(padding),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: deleteCubit.lists.contains(widget.note.id)
                  ? widget.color.surfaceVariant
                  : widget.color.surface,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.note.title.isNotEmpty
                    ? Text(
                        widget.note.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: widget.note.title.isNotEmpty ? 12.0 : 0.0,
                ),
                widget.note.body.isNotEmpty
                    ? Text(
                        widget.note.body,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: widget.note.body.isNotEmpty ? 12.0 : 0.0,
                ),
                Row(
                  children: [
                    Text(
                      DateFormatting.thumbnailDate(widget.note.lastEdit),
                      style: TextStyle(
                        fontSize: 13,
                        color: widget.color.onSurfaceVariant,
                      ),
                    ),
                    const Spacer(),
                    BlocBuilder<DeleteNotesCubit, DeleteNotesState>(
                      builder: (context, state) {
                        if (state is DeleteNotesFilled) {
                          return Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: deleteCubit.lists.contains(widget.note.id)
                                  ? widget.color.secondary
                                  : widget.color.background,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: widget.color.onSecondary,
                              size: deleteCubit.lists.contains(widget.note.id)
                                  ? 20
                                  : 0,
                            ),
                          );
                        }
                        return const SizedBox(
                          height: 24,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
