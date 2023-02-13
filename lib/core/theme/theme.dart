import 'package:flutter/material.dart';

const _yellow = Color(0xffffbb00);
const _white = Color(0xffffffff);
const _black = Color(0xff1b1b1b);
const _background = Color(0xfff7f7f7);
const _grey = Color(0xff656565);
const _greyVariant = Color(0xffebebeb);


class AppTheme {
  ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
        background: _background,
        primary: _white,
        onPrimary: _black,
        secondary: _yellow,
        onSecondary: _white,
        surface: _white,
        surfaceVariant: _greyVariant,
        onSurface: _black,
        onSurfaceVariant: _grey,),
  );
}
