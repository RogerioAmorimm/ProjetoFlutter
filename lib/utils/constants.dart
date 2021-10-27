import 'package:flutter/material.dart';

class Constants {
  static const String spToken = 'spToken';
  static const String spId = 'spId';
  static const String spEmail = 'spEmail';
  static const String spSenha = 'spSenha';
  static const String spNome = "spNome";
  static const String mensagemErroInterno = 'Erro interno! Tente novamente.';
  static const String mensagemErroPadrao = 'Erro de processamento';
  static const String mesagemErro = '';
  static const String logo = 'assets/logo.png';
  static const MaterialColor primaria = MaterialColor(0xFF0065AD, {
    50: Color(0xFFE0EDF5),
    100: Color(0xFFB3D1E6),
    200: Color(0xFF80B2D6),
    300: Color(0xFF4D93C6),
    400: Color(0xFF267CB9),
    500: Color(0xFF0065AD),
    600: Color(0xFF005DA6),
    700: Color(0xFF00539C),
    800: Color(0xFF004993),
    900: Color(0xFF003783),
  });
  static const MaterialColor primariaContraste = MaterialColor(0xFFFFFFFF, {
    50: Color(0xFF001E33),
    100: Color(0xFF001E33),
    200: Color(0xFF001E33),
    300: Color(0xFF000000),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });
  static const MaterialColor accent = MaterialColor(0xFF81C9FC, {
    50: Color(0xFFF0F9FF),
    100: Color(0xFFD9EFFE),
    200: Color(0xFFC0E4FE),
    300: Color(0xFFA7D9FD),
    400: Color(0xFF94D1FC),
    500: Color(0xFF81C9FC),
    600: Color(0xFF79C3FC),
    700: Color(0xFF6EBCFB),
    800: Color(0xFF64B5FB),
    900: Color(0xFF51A9FA),
  });
  static const MaterialColor accentContraste = MaterialColor(0xFF003783, {
    50: Color(0xFF003783),
    100: Color(0xFF003783),
    200: Color(0xFF003783),
    300: Color(0xFF003783),
    400: Color(0xFF003783),
    500: Color(0xFF003783),
    600: Color(0xFF001533),
    700: Color(0xFF001533),
    800: Color(0xFF001533),
    900: Color(0xFF001533),
  });
}
