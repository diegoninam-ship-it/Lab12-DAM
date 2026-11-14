import 'package:flutter/cupertino.dart';
import '../data/alumnos_data.dart';

/// Pantalla de perfil del usuario. Mismo patrón de Lab08 (filas
/// generadas desde una lista de mapas), pero con CupertinoListSection
/// en vez de Card, igual que en Menú y Listar Alumnos.
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  static final List<Map<String, dynamic>> _filasPerfil = [
    {'icono': CupertinoIcons.person, 'etiqueta': 'Nombre', 'clave': 'nombre'},
    {'icono': CupertinoIcons.mail, 'etiqueta': 'Email', 'clave': 'email'},
    {'icono': CupertinoIcons.phone, 'etiqueta': 'Teléfono', 'clave': 'telefono'},
    {'icono': CupertinoIcons.briefcase, 'etiqueta': 'Roles', 'clave': 'rol'},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Perfil'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeBlue.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.person_fill,
                      size: 44,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    perfilUsuario['nombre']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: CupertinoColors.label,
                    ),
                  ),
                  Text(
                    perfilUsuario['email']!,
                    style: const TextStyle(color: CupertinoColors.secondaryLabel),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            CupertinoListSection.insetGrouped(
              children: _filasPerfil.map((fila) {
                return CupertinoListTile(
                  leading: Icon(fila['icono'] as IconData, color: CupertinoColors.activeBlue),
                  title: Text(
                    fila['etiqueta'] as String,
                    style: const TextStyle(color: CupertinoColors.secondaryLabel, fontSize: 12),
                  ),
                  additionalInfo: Text(
                    perfilUsuario[fila['clave'] as String]!,
                    style: const TextStyle(
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: CupertinoColors.systemGrey5,
                  onPressed: () {},
                  child: const Text('EDITAR PERFIL'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}