import 'package:flutter/cupertino.dart';
import '../routes/app_routes.dart';

/// Pantalla de menú principal. Mismo patrón de Lab08 (lista de mapas
/// generando las filas), pero envuelta en CupertinoListSection.insetGrouped
/// en vez de un Card — el reemplazo que decidimos en el Paso 1 de
/// planificación para la capacidad "Cards".
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static final List<Map<String, dynamic>> _opciones = [
    {
      'icono': CupertinoIcons.person,
      'titulo': 'Registrar Alumnos',
      'ruta': AppRoutes.registrar,
    },
    {
      'icono': CupertinoIcons.list_bullet,
      'titulo': 'Listar Alumnos',
      'ruta': AppRoutes.alumnos,
    },
    {
      'icono': CupertinoIcons.person_crop_circle,
      'titulo': 'Perfil',
      'ruta': AppRoutes.perfil,
    },
    {
      'icono': CupertinoIcons.square_arrow_left,
      'titulo': 'Logout',
      'ruta': AppRoutes.login,
    },
  ];

  void _navegar(BuildContext context, Map<String, dynamic> opcion) {
    if (opcion['titulo'] == 'Logout') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
      return;
    }

    Navigator.pushNamed(context, opcion['ruta'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Menú'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            CupertinoListSection.insetGrouped(
              children: _opciones.map((opcion) {
                final esLogout = opcion['titulo'] == 'Logout';

                return CupertinoListTile(
                  leading: Icon(
                    opcion['icono'] as IconData,
                    color: esLogout ? CupertinoColors.systemRed : CupertinoColors.activeBlue,
                  ),
                  title: Text(
                    opcion['titulo'] as String,
                    style: TextStyle(
                      color: esLogout ? CupertinoColors.systemRed : CupertinoColors.label,
                    ),
                  ),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _navegar(context, opcion),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}