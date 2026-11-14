import 'package:flutter/cupertino.dart';
import '../data/alumnos_data.dart';
import '../routes/app_routes.dart';
import '../widgets/etiqueta_estado.dart';

/// Lista de alumnos registrados. Sigue siendo StatefulWidget por la
/// misma razón que en Lab08: al volver de RegistrarAlumnoScreen
/// necesita setState para redibujarse con el alumno nuevo.
class ListarAlumnosScreen extends StatefulWidget {
  const ListarAlumnosScreen({super.key});

  @override
  State<ListarAlumnosScreen> createState() => _ListarAlumnosScreenState();
}

class _ListarAlumnosScreenState extends State<ListarAlumnosScreen> {
  Future<void> _irARegistrar() async {
    await Navigator.pushNamed(context, AppRoutes.registrar);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Alumnos'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          onPressed: _irARegistrar,
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: CupertinoSearchTextField(
                placeholder: 'Buscar alumno...',
              ),
            ),
            const SizedBox(height: 12),

            if (alumnos.isEmpty)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: Text('No hay alumnos registrados')),
              )
            else
              CupertinoListSection.insetGrouped(
                children: alumnos.map((alumno) {
                  final nombreCompleto = '${alumno['nombre']} ${alumno['apellido']}';

                  return CupertinoListTile(
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeBlue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        (alumno['nombre'] as String)[0],
                        style: const TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    title: Text(nombreCompleto),
                    additionalInfo: EtiquetaEstado(nota: alumno['nota'] as int),
                    subtitle: Text('Nota: ${alumno['nota']}'),
                    trailing: const CupertinoListTileChevron(),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}