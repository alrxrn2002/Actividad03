import 'package:actividad02/firebase_options.dart';
import 'package:actividad02/moduls/screens/codigo.dart';
import 'package:actividad02/moduls/screens/contrasena.dart';
import 'package:actividad02/moduls/screens/correo.dart';
import 'package:actividad02/moduls/screens/create_account.dart';
import 'package:actividad02/moduls/screens/login.dart';
import 'package:actividad02/navigation/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//flutter pub get
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/correo': (context) => const Correo(),
        '/codigo': (context) => const Codigo(),
        '/contrasena': (context) => const Contrasena(),
        '/login': (context) => const Login(),
        '/create_account': (context) => const CreateAccount(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
