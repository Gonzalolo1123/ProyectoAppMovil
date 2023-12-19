// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'crearCompetencia.dart';

class horarioData {
  List<String> CategoriaH =[] ;
  List<String> CompetenciaH = [];
  String HoraH = '';
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

  horarioData nuevoHorario = horarioData(); // Instancia para el nuevo horario

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
                      selectedOptions: nuevoHorario.CategoriaH,
                      customText: 'Selecciona Categorías',
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Selecciona Competencia',
                      style: TextStyle(fontSize: 18),
                    ),
                    MyCheckboxMenu(
                      options: widget.competitionData.getSelectedCompetitions(),
                      selectedOptions: nuevoHorario.CompetenciaH,
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
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // Validar el formato de la hora HH:MM
                    if (isValidHourFormat(horaController.text)) {
                      // La hora tiene el formato correcto, puedes usarla
                      String hora = horaController.text;
                      nuevoHorario.HoraH = hora;
                      horarios.add(nuevoHorario);
                      // Aquí puedes agregar la lógica para crear el horario
                      print('Hora de la competencia: $hora');
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
