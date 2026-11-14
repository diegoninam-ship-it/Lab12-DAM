import 'package:flutter/cupertino.dart';
import '../screens/login_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/listar_alumnos_screen.dart';
import '../screens/registrar_alumno_screen.dart';
import '../screens/perfil_screen.dart';

/// Constantes de rutas con nombre, igual que en Lab08. La diferencia
/// está en cómo se construye cada entrada del mapa: usamos
/// CupertinoPageRoute en vez de devolver el widget directamente,
/// para que la transición entre pantallas sea el deslizamiento
/// horizontal típico de iOS en vez de la transición Material por
/// defecto que Navigator usaría si solo devolviéramos el widget.
class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String menu = '/menu';
  static const String alumnos = '/alumnos';
  static const String registrar = '/registrar';
  static const String perfil = '/perfil';

  static Map<String, WidgetBuilder> get rutas => {
        login: (context) => const LoginScreen(),
        menu: (context) => const MenuScreen(),
        alumnos: (context) => const ListarAlumnosScreen(),
        registrar: (context) => const RegistrarAlumnoScreen(),
        perfil: (context) => const PerfilScreen(),
      };
}