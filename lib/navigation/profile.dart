import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 169, 205, 226),
                  child: Text('AN'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  children: [
                    Text(
                      'Alejandra Nieves',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hace 10 minutos',
                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                    )
                  ],
                ),
                Spacer(),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Cerrar sesión'),
            ),
          )
        ]));
  }
}
