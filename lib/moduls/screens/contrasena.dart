import 'package:flutter/material.dart';

class Contrasena extends StatefulWidget {
  const Contrasena({super.key});

  @override
  State<Contrasena> createState() => _ContrasenaState();
}

class _ContrasenaState extends State<Contrasena> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllerDos = TextEditingController();

  // Dos variables separadas para manejar la visibilidad de cada campo de contraseña
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscurePassword = !_isObscurePassword;
                        });
                      },
                      icon: Icon(
                        _isObscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordControllerDos,
                  obscureText: _isObscureConfirmPassword,
                  decoration: InputDecoration(
                    hintText: 'Repetir contraseña',
                    label: const Text('Repetir contraseña'),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscureConfirmPassword =
                              !_isObscureConfirmPassword;
                        });
                      },
                      icon: Icon(
                        _isObscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, repite la contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50, width: double.infinity),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_passwordController.text ==
                            _passwordControllerDos.text) {
                          Navigator.pushNamed(context, '/login');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Las contraseñas no coinciden'),
                              backgroundColor: Color.fromARGB(255, 255, 6, 6),
                            ),
                          );
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 37, 63, 77),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
