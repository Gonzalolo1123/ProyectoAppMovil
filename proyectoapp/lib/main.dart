// ignore_for_file: use_key_in_widget_constructors, avoid_print
import 'package:flutter/material.dart';
import 'logInUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Inicio(),
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(236, 236, 244, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Agrega tu imagen aquí
          Image.asset(
            'assets/logo.png',
            width: 250,
            height: 250,
          ),
          const SizedBox(width: 10.0),
          const Text(
            'JudgeSync',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          const SizedBox(height: 30.0), // Espacio entre la imagen y los botones
          ElevatedButton(
            onPressed: () async {
              // Agrega la lógica para el botón de Iniciar Sesión
            
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogIn()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              padding: const EdgeInsets.all(15.0),
            ),
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize:
                    25, // Ajusta el tamaño de fuente según tus necesidades
              ),
            ),
          ),
          const SizedBox(height: 10.0), // Espacio entre los botones
          ElevatedButton(
            onPressed: () {
              // Agrega la lógica para el botón de Crear Cuenta
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogUp()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              padding: const EdgeInsets.all(15.0),
            ),
            child: const Text(
              'Crear Cuenta',
              style: TextStyle(
                fontSize:
                    25, // Ajusta el tamaño de fuente según tus necesidades
              ),
            ),
          ),
        ],
      ),
    );
  }
}
