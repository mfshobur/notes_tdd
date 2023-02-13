import 'package:flutter/material.dart';
import 'package:notes_tdd/core/dateformat/date_format.dart';

class ShowTimeCharacters extends StatefulWidget {
  DateTime time;
  int length;
  ShowTimeCharacters({
    super.key,
    required this.time,
    required this.length,
  });

  @override
  State<ShowTimeCharacters> createState() => _ShowTimeCharactersState();
}

class _ShowTimeCharactersState extends State<ShowTimeCharacters> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Text(
      '${DateFormatting.notePageDate(widget.time)} | ${widget.length} characters',
      style: TextStyle(
        color: color.onSurfaceVariant,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );
  }
}
