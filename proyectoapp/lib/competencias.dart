// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:proyectoapp/Participantes.dart';
import 'crearCompetencia.dart';
import 'horario.dart';

class CompetenciaPage extends StatefulWidget {
  final String nombreCompetencia;
  final CompetitionData competitionData;

  const CompetenciaPage(this.nombreCompetencia, this.competitionData,
      {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CompetenciaPageState createState() => _CompetenciaPageState();
}

class _CompetenciaPageState extends State<CompetenciaPage> {
  List<String> selectedCategories = [];

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a la competencia de ${widget.nombreCompetencia}. En este apartado tendrás acceso a todo lo necesario para realizar un excelente control de jurado.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '¿Qué categoría/as controlarás?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            if (widget.competitionData.getSelectedCategories().isNotEmpty)
              Column(
                children: widget.competitionData
                    .getSelectedCategories()
                    .map((category) {
                  return Column(
                    children: [
                      Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CheckboxListTile(
                          title: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: selectedCategories.contains(category),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null) {
                                if (value) {
                                  selectedCategories.add(category);
                                } else {
                                  selectedCategories.remove(category);
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
            else
              const Text('No se han seleccionado competencias.'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
          onPressed: () {
            // Mostrar la alerta
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('¡Aun no has creado tu horario!'),
                  content: const Text('Crea el horario para comenzar la competencia.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Navegar a la pantalla de Horario
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Horario(competitionData: CompetitionData()),
                          ),
                        );
                      },
                      child: const Text('Crear Horario'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Imprimir "Mas tarde"
                        print('Mas tarde');
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParticipantesInscripcion(competitionData: CompetitionData()),
                      ),
                    );
                      },
                      child: const Text('Más tarde'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Empezar competencia'),
        ),
 
        ),
      ),
    );
  }
}
