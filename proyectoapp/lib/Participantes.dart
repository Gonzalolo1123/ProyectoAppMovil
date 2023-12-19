// ignore_for_file: library_private_types_in_public_api, avoid_print
import 'package:flutter/material.dart';
import 'crearCompetencia.dart';

class Participante {
  String nombre;
  String institucion;
  String anoNac;

  Participante({
    required this.nombre,
    required this.institucion,
    required this.anoNac,
  });

  @override
  String toString() {
    return 'Nombre: $nombre, Institución: $institucion, Año de Nacimiento: $anoNac';
  }
}

class ParticipantesInscripcion extends StatefulWidget {
  const ParticipantesInscripcion({
    Key? key,
    required this.competitionData,
  }) : super(key: key);

  final CompetitionData competitionData;

  @override
  _ParticipantesInscripcionState createState() =>
      _ParticipantesInscripcionState();
}

class _ParticipantesInscripcionState extends State<ParticipantesInscripcion> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController institucionController = TextEditingController();
  TextEditingController anoNac = TextEditingController();

  // Diccionario para almacenar participantes inscritos
  Map<String, Participante> participantesInscritos = {};

  @override
  Widget build(BuildContext context) {
    List<String> CategoriaSelect = [];
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Inscripción de Participante',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: institucionController,
                  decoration: const InputDecoration(
                    labelText: 'Colegio/Institución',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  child: MyCheckboxMenu(
                options: widget.competitionData.selectedCategories,
                selectedOptions: CategoriaSelect,
                customText: 'Selecciona Categorías',
              )),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: anoNac,
                  decoration: const InputDecoration(
                    labelText: 'Año Nacimiento',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Dentro del onPressed de Inscribir Participante
              ElevatedButton(
                onPressed: () {
                  // Crear un nuevo participante con los datos ingresados
                  Participante nuevoParticipante = Participante(
                    nombre: nombreController.text,
                    institucion: institucionController.text,
                    anoNac: anoNac.text,
                  );

                  // Agregar el nuevo participante al diccionario de participantes inscritos
                  participantesInscritos[nuevoParticipante.nombre] =
                      nuevoParticipante;

                  // Mostrar los participantes inscritos
                  print(
                      'Participante Inscrito: ${participantesInscritos.values.map((participante) => participante.toString()).join(', ')}');

                  // Limpiar los campos de texto después de la inscripción
                  nombreController.clear();
                  institucionController.clear();
                  anoNac.clear();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text('Inscribir participante'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Mostrar todos los participantes inscritos
                  print(
                      'Todos los Participantes Inscritos: ${participantesInscritos.values.map((participante) => participante.toString()).join(', ')}');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text('Finalizar Inscripciones'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
