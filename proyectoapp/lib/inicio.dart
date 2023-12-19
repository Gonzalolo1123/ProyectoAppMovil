// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'crearCompetencia.dart';
import 'competencias.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.competitionData}) : super(key: key);

  final CompetitionData competitionData;

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
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 10.0, left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '¿Qué competencia debes controlar hoy?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              if (competitionData.getSelectedCompetitions().isNotEmpty)
                Column(
                  children: competitionData
                      .getSelectedCompetitions()
                      .map((competition) {
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Puedes agregar lógica específica cuando se presiona el botón
                            print('Competencia seleccionada: $competition');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CompetenciaPage(competition,competitionData),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(350, 50),
                            padding: const EdgeInsets.all(15.0),
                          ),
                          child: Text(
                            competition,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 20), // Espaciado vertical entre botones
                      ],
                    );
                  }).toList(),
                )
              else
                const Text('No se han seleccionado competencias.'),
            ],
          ),
        ),
      ),
    );
  }
}
