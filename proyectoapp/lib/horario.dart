// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'crearCompetencia.dart';

class horarioData {
  List<String> CategoriaH = [];
  List<String> CompetenciaH = [];
  String HoraH = '';
  @override
  String toString() {
    if (CompetenciaH.length != CategoriaH.length) {
      return 'Error: Competencias y Categorías tienen longitudes diferentes';
    }

    List<String> competenciasYcategorias = [];
    for (int i = 0; i < CompetenciaH.length; i++) {
      competenciasYcategorias.add('${CompetenciaH[i]} ${CategoriaH[i]}');
    }

    return 'Hora: $HoraH, Competencias: ${competenciasYcategorias.join(', ')}';
  }
}

class Horario extends StatefulWidget {
  final CompetitionData competitionData;

  Horario({Key? key, required this.competitionData}) : super(key: key);

  @override
  _HorarioState createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {
  final TextEditingController horaController = TextEditingController();
  final List<horarioData> horarios = [];

  @override
  Widget build(BuildContext context) {
    horarioData Horario = horarioData();
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Horario',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Seleccione Categoria',
                      style: TextStyle(fontSize: 18),
                    ),
                    MyCheckboxMenu(
                      options: widget.competitionData.selectedCategories,
                      selectedOptions: Horario.CategoriaH,
                      customText: 'Selecciona Categorías',
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Selecciona Competencia',
                      style: TextStyle(fontSize: 18),
                    ),
                    MyCheckboxMenu(
                      options: widget.competitionData.getSelectedCompetitions(),
                      selectedOptions: Horario.CompetenciaH,
                      customText: 'Selecciona Competencia',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ingrese hora de la competencia',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: horaController,
                    decoration: const InputDecoration(
                      hintText: 'HH:MM',
                      labelText: 'Hora de la competencia',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Validar el formato de la hora HH:MM
                    if (isValidHourFormat(horaController.text)) {
                      // La hora tiene el formato correcto, puedes usarla
                      String hora = horaController.text;

                      // Buscar un horario existente con la misma hora
                      horarioData horarioExistente = horarios.firstWhere(
                        (horario) => horario.HoraH == hora,
                        orElse: () {
                          // Si no existe, crear un nuevo horario
                          horarioData nuevoHorario = horarioData();
                          nuevoHorario.HoraH = hora;
                          return nuevoHorario;
                        },
                      );

                      // Crear una nueva instancia de horarioData
                      horarioData nuevoHorario = horarioExistente;

                      // Configurar el nuevo horario con los datos ingresados
                      nuevoHorario.CategoriaH.addAll(Horario.CategoriaH);
                      nuevoHorario.CompetenciaH.addAll(Horario.CompetenciaH);

                      // Agregar el nuevo horario a la lista
                      if (!horarios.contains(nuevoHorario)) {
                        horarios.add(nuevoHorario);
                      }

                      // Mostrar el horario agregado
                      print(
                          'Competencia Agregada: ${horarios.map((horario) => horario.toString()).join(', ')}');
                      // Limpiar checkboxes y TextField
                      horaController.clear();
                      Horario.CategoriaH.clear();
                      Horario.CompetenciaH.clear();
                    } else {
                      // La hora no tiene el formato correcto
                      print('Formato de hora incorrecto. Debe ser HH:MM');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    padding: const EdgeInsets.all(15.0),
                  ),
                  child: const Text('Agregar al Horario'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('horario creado');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    padding: const EdgeInsets.all(15.0),
                  ),
                  child: const Text('Crear Horario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidHourFormat(String input) {
    final RegExp regExp = RegExp(r'^[0-2]?[0-9]:[0-5][0-9]$');
    return regExp.hasMatch(input);
  }
}
