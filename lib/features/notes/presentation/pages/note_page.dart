import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/create_note_cubit.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/delete_notes_cubit.dart';
import 'package:notes_tdd/features/notes/presentation/cubit/update_note_cubit.dart';
import 'package:notes_tdd/features/notes/presentation/widgets/note_time_characters_show.dart';

import '../../domain/entities/notes.dart';

class NotePage extends StatefulWidget {
  final Note? note;
  const NotePage({super.key, required this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final DateTime _timeOpened = DateTime.now();
  final _streamController = StreamController<int>();
  int _initialLength = 0;
  late Stream<int> _characterLength;
  late FocusNode bodyFocus;

  Future<bool> saveNote() async {
    // check if note title and body is empty
    if (_titleController.text.isNotEmpty || _bodyController.text.isNotEmpty) {
      // if not empty and the note is null, then create new note
      if (widget.note == null) {
        context.read<CreateNoteCubit>().onCreateNote(
              _titleController.text,
              _bodyController.text,
              DateTime.now(),
              null,
            );
      }
      // if the note is not empty and not null
      else {
        // if the title and body change from previous, update the note
        if ((_titleController.text != widget.note!.title &&
                widget.note!.title.length != _titleController.text.length) ||
            (_bodyController.text != widget.note!.body &&
                widget.note!.body.length != _bodyController.text.length)) {
          context.read<UpdateNoteCubit>().onUpdateNote(
                widget.note!.id,
                _titleController.text,
                _bodyController.text,
                DateTime.now(),
                null,
              );
        }
      }
    }
    // if the note is empty
    else {
      // if the note is not null, delete the note
      if (widget.note != null) {
        context.read<DeleteNotesCubit>().onDeleteNote(widget.note!.id);
      }
    }
    Navigator.pop(context);
    return true;
  }

  @override
  void initState() {
    _characterLength = _streamController.stream;
    if (widget.note?.title != null) {
      _titleController.text = widget.note!.title;
    }
    if (widget.note?.body != null) {
      _bodyController.text = widget.note!.body;
    }
    _initialLength = _titleController.text.length + _bodyController.text.length;
    bodyFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    bodyFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        bodyFocus.requestFocus();
      },
      child: WillPopScope(
        onWillPop: saveNote,
        child: Scaffold(
          backgroundColor: color.primary,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: color.primary,
            leading: IconButton(
              onPressed: saveNote,
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              widget.note != null
                  ? PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              Navigator.pop(context);
                              context
                                  .read<DeleteNotesCubit>()
                                  .onDeleteNote(widget.note!.id);
                            },
                            child: const Text('Delete'),
                          ),
                        ];
                      },
                    )
                  : const SizedBox(),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      cursorColor: color.secondary,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        _streamController.add(_titleController.text.length +
                            _bodyController.text.length);
                      },
                    ),
                    StreamBuilder(
                      initialData: _initialLength,
                      stream: _characterLength,
                      builder: (context, snapshot) {
                        return ShowTimeCharacters(
                          time: widget.note?.lastEdit ?? _timeOpened,
                          length: snapshot.data!,
                        );
                      },
                    ),
                    TextFormField(
                      maxLines: null,
                      controller: _bodyController,
                      cursorColor: color.secondary,
                      autofocus: widget.note == null,
                      focusNode: bodyFocus,
                      decoration: const InputDecoration(
                        hintText: 'Start typing',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        _streamController.add(
                          _titleController.text.length +
                              _bodyController.text.length,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
