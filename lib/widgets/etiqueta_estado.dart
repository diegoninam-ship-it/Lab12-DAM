import 'package:flutter/cupertino.dart';

/// Etiqueta "Aprobado"/"Desaprobado" calculada a partir de la nota.
/// Misma lógica que en Lab08; solo cambian los colores, que ahora
/// vienen de CupertinoColors en vez de una paleta fija.
class EtiquetaEstado extends StatelessWidget {
  final int nota;

  const EtiquetaEstado({super.key, required this.nota});

  @override
  Widget build(BuildContext context) {
    final bool aprobado = nota >= 11;
    final Color colorTexto = aprobado ? CupertinoColors.systemGreen : CupertinoColors.systemRed;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colorTexto.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        aprobado ? 'Aprobado' : 'Desaprobado',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: colorTexto,
        ),
      ),
    );
  }
}