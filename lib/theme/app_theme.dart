import 'package:flutter/cupertino.dart';

/// Tema global con CupertinoThemeData, usando CupertinoColors de
/// sistema (dinámicos: se adaptan a modo claro/oscuro automáticamente)
/// en vez de una paleta fija como en Lab08.
class AppTheme {
  AppTheme._();

  static CupertinoThemeData get tema {
    return const CupertinoThemeData(
      primaryColor: CupertinoColors.activeBlue,
      scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      barBackgroundColor: CupertinoColors.systemBackground,
      textTheme: CupertinoTextThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
    );
  }
}