import 'package:flutter/material.dart';
import 'crearCompetencia.dart';
import 'UnirseCompetencia.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            flexibleSpace: Align(
              alignment: const Alignment(0.0, 0.8),
              child: GestureDetector(
                onTap: () {
                  // Lógica cuando la imagen es presionada
                  print('Imagen presionada');
                },
                child: Image.asset(
                  'assets/logo.png',
                  height: 55,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                  height: 20.0), // Espacio entre el AppBar y el texto
              const Text(
                'Gestor de Competencias',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                      20, // Puedes ajustar el tamaño de fuente según tus necesidades
                ),
              ),
              const SizedBox(height: 20), // Espacio entre los textos
              const Text(
                'Inicia un campeonato desde cero, diseña los horarios, asigna categorías y define las competencias. Si el campeonato en el que trabajarás ya existe, únete a él simplemente buscándolo en el listado de competencias existentes.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize:
                      20, // Puedes ajustar el tamaño de fuente según tus necesidades
                ),
                textAlign: TextAlign.center, // Alinea el texto al centro
              ),
              const SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CrearCompetencia()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 70),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text(
                  'Crear',
                  style: TextStyle(
                    fontSize:
                        25, // Ajusta el tamaño de fuente según tus necesidades
                  ),
                ),
              ),
              const SizedBox(height: 10.0), // Espacio entre los botones
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UnirseCompetencia()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 70),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text(
                  'Unirse',
                  style: TextStyle(
                    fontSize:
                        25, // Ajusta el tamaño de fuente según tus necesidades
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
