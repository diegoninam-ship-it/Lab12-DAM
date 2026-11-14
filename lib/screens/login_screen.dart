import 'package:flutter/cupertino.dart';
import '../routes/app_routes.dart';

/// Pantalla de inicio de sesión. Login simulado, igual que en Lab08,
/// pero con widgets Cupertino: CupertinoTextField, CupertinoButton.filled
/// y CupertinoAlertDialog en vez de SnackBar para los errores.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _ocultarPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Reemplazo de ScaffoldMessenger/SnackBar, que no existen en
  // Cupertino. showCupertinoDialog es la forma nativa de iOS de
  // comunicar un error: una alerta modal centrada, no un banner
  // inferior.
  void _mostrarError(String mensaje) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Atención'),
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

  void _iniciarSesion() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _mostrarError('Completa email y contraseña');
      return;
    }

    Navigator.pushReplacementNamed(context, AppRoutes.menu);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeBlue.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.person_crop_circle,
                      size: 36,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: CupertinoColors.label,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Ingresa tus credenciales para continuar',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: CupertinoColors.secondaryLabel),
                  ),
                  const SizedBox(height: 24),

                  CupertinoTextField(
                    controller: _emailController,
                    placeholder: 'Email',
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(CupertinoIcons.mail, size: 18, color: CupertinoColors.secondaryLabel),
                    ),
                  ),
                  const SizedBox(height: 14),

                  CupertinoTextField(
                    controller: _passwordController,
                    obscureText: _ocultarPassword,
                    placeholder: 'Password',
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(CupertinoIcons.lock, size: 18, color: CupertinoColors.secondaryLabel),
                    ),
                    suffix: CupertinoButton(
                      padding: const EdgeInsets.only(right: 6),
                      minimumSize: Size.zero,
                      onPressed: () {
                        setState(() => _ocultarPassword = !_ocultarPassword);
                      },
                      child: Icon(
                        _ocultarPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                        size: 18,
                        color: CupertinoColors.secondaryLabel,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton.filled(
                      onPressed: _iniciarSesion,
                      child: const Text('LOGIN'),
                    ),
                  ),
                  const SizedBox(height: 4),

                  CupertinoButton(
                    onPressed: () {},
                    child: const Text('¿Olvidaste tu contraseña?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}