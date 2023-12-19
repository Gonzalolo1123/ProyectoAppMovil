import 'package:flutter/material.dart';
class UnirseCompetencia extends StatelessWidget {
  const UnirseCompetencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Center(
        child: Text(
          'Contenido de la página para unirse a la competencia',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
