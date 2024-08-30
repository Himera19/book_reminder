import 'package:flutter/material.dart';

const int _lightPrimaryValue = 0xFFFF9800;

/// Aydınlık tema için kişiselleştirilmiş renk paleti.
const MaterialColor lightColor = MaterialColor(
  _lightPrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFCF7),
    100: Color(0xFFFFE0B2),
    200: Color(0xFFFFCC80),
    300: Color(0xFFFFB74D),
    400: Color(0xFFFFA726),
    500: Color(0xFFFF9800),
    600: Color(0xFFFB8C00),
    700: Color(0xFFF57C00),
    800: Color(0xFFEF6C00),
    900: Color(0xFFE65100),
  },
);

const int _darkPrimaryValue = 0xFF757575;

/// Karanlıl tema için kişiselleştirilmiş renk paleti.

const MaterialColor darkColor = MaterialColor(
  _darkPrimaryValue,
  <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    400: Color(0xFFBDBDBD),
    500: Color(0xFF9E9E9E),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    900: Color(0xFF212121),
  },
);
