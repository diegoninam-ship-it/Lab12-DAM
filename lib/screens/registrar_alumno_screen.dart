import 'package:flutter/cupertino.dart';
import '../data/alumnos_data.dart';

/// Formulario para agregar un alumno a la lista global. Misma lógica
/// de validación que en Lab08 (int.tryParse para la nota), pero los
/// errores se muestran con CupertinoAlertDialog en vez de SnackBar.
class RegistrarAlumnoScreen extends StatefulWidget {
  const RegistrarAlumnoScreen({super.key});

  @override
  State<RegistrarAlumnoScreen> createState() => _RegistrarAlumnoScreenState();
}

class _RegistrarAlumnoScreenState extends State<RegistrarAlumnoScreen> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _notaController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _notaController.dispose();
    super.dispose();
  }

  void _mostrarMensaje(String titulo, String mensaje) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _guardar() {
    final nombre = _nombreController.text.trim();
    final apellido = _apellidoController.text.trim();
    final notaTexto = _notaController.text.trim();

    if (nombre.isEmpty || apellido.isEmpty || notaTexto.isEmpty) {
      _mostrarMensaje('Atención', 'Completa todos los campos');
      return;
    }

    // Misma validación de Lab08: tryParse evita que un texto no
    // numérico lance una excepción.
    final nota = int.tryParse(notaTexto);
    if (nota == null || nota < 0 || nota > 20) {
      _mostrarMensaje('Atención', 'La nota debe ser un número entre 0 y 20');
      return;
    }

    alumnos.add({
      'nombre': nombre,
      'apellido': apellido,
      'nota': nota,
    });

    // showCupertinoDialog aquí no solo informa: encadena el cierre
    // del formulario (Navigator.pop de la pantalla completa) a que
    // el usuario confirme la alerta con OK, para que alcance a leer
    // el mensaje de éxito antes de volver a Listar Alumnos.
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Listo'),
        content: Text('$nombre $apellido registrado correctamente'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context); // cierra el diálogo
              Navigator.pop(context); // cierra el formulario
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Registrar Alumno'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CupertinoTextField(
                controller: _nombreController,
                placeholder: 'Nombre del alumno',
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              const SizedBox(height: 14),

              CupertinoTextField(
                controller: _apellidoController,
                placeholder: 'Apellido',
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              const SizedBox(height: 14),

              CupertinoTextField(
                controller: _notaController,
                keyboardType: TextInputType.number,
                placeholder: 'Nota (0 - 20)',
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(CupertinoIcons.book, size: 18, color: CupertinoColors.secondaryLabel),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: _guardar,
                  child: const Text('GUARDAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}