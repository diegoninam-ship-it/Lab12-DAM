/// Datos en memoria de la app (sin backend ni persistencia).
/// Idéntico al de Lab08: la capa de datos no depende de si la UI
/// se construye con Material o Cupertino.
final List<Map<String, dynamic>> alumnos = [
  {'nombre': 'Ana', 'apellido': 'Torres', 'nota': 18},
  {'nombre': 'Luis', 'apellido': 'García', 'nota': 12},
  {'nombre': 'María', 'apellido': 'López', 'nota': 9},
  {'nombre': 'Carlos', 'apellido': 'Ruiz', 'nota': 15},
];

/// Datos fijos del perfil mostrado en PerfilScreen.
final Map<String, String> perfilUsuario = {
  'nombre': 'María González',
  'email': 'maria.gonzalez@correo.com',
  'telefono': '912345678',
  'rol': 'Docente',
};