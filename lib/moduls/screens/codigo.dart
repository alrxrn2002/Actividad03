import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Codigo extends StatefulWidget {
  const Codigo({super.key});

  @override
  State<Codigo> createState() => _LoginState();
}

class _LoginState extends State<Codigo> {
  final TextEditingController _numeroController = TextEditingController();

  final bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                TextFormField(
                  controller: _numeroController,
                  decoration: const InputDecoration(
                      hintText: 'Código de verificación',
                      label: Text('Código de verificación')),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Solo permite números
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa el código';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 50, width: double.infinity),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/contrasena');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 63, 77),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          )),
                      child: const Text('Validar código')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
