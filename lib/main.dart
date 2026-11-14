import 'package:flutter/cupertino.dart';
import 'theme/app_theme.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const GestionAlumnosApp());
}

/// Widget raíz: CupertinoApp en vez de MaterialApp. Es la decisión
/// que define todo el sistema de diseño de la app — a partir de
/// aquí, cada pantalla usa widgets Cupertino y hereda la transición
/// de navegación deslizante típica de iOS automáticamente.
class GestionAlumnosApp extends StatelessWidget {
  const GestionAlumnosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Lab12 - Gestión de Alumnos (Cupertino)',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.rutas,
    );
  }
}