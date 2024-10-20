import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Ingresa un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
        backgroundColor: const Color.fromARGB(255, 37, 63, 77),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
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
                TextFormField(
                    validator: validateEmail,
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Correo electrónico',
                        label: Text('Correo electrónico')),
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                ),
                const SizedBox(height: 50, width: double.infinity),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                          print('credencial: $credential');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                        Navigator.pushReplacementNamed(context, '/profile');
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 63, 77),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: const Text('Iniciar sesión')),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Cambiamos a TextButton para el enlace de 'Crear cuenta'
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_account');
                  },
                  child: const Text(
                    'Crear cuenta',
                    style: TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 55, 55, 56)),
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
