// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'inicio.dart';
import 'horario.dart';

class CompetitionData {
  String name = '';
  String date = '';
  List<String> selectedCategories = [];
  List<String> selectedCompetitions = [];

  List<String> getSelectedCompetitions() {
    return selectedCompetitions;
  }

  List<String> getSelectedCategories() {
    return selectedCategories;
  }
}

class MyCheckboxMenu extends StatefulWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final String customText;

  const MyCheckboxMenu({
    Key? key,
    required this.options,
    required this.selectedOptions,
    this.customText = 'Selecciona una opción',
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCheckboxMenuState createState() => _MyCheckboxMenuState();
}

class _MyCheckboxMenuState extends State<MyCheckboxMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        height: 55,
        child: PopupMenuButton(
          offset: const Offset(0, 50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.category,
                  color: Colors.grey, // Color del icono
                ),
                const SizedBox(width: 8),
                Text(
                  widget.customText,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey, // Color del texto
                  ),
                ),
              ],
            ),
          ),
          itemBuilder: (context) {
            return widget.options.map((option) {
              return PopupMenuItem(
                value: option,
                child: Row(
                  children: [
                    Icon(
                      widget.selectedOptions.contains(option)
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      option,
                    ),
                  ],
                ),
              );
            }).toList();
          },
          onSelected: (value) {
            setState(() {
              if (widget.options.contains(value)) {
                widget.selectedOptions.contains(value)
                    ? widget.selectedOptions.remove(value)
                    : widget.selectedOptions.add(value);
              }
            });
          },
        ),
      ),
    );
  }
}

class CrearCompetencia extends StatefulWidget {
  const CrearCompetencia({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CrearCompetenciaState createState() => _CrearCompetenciaState();
}

class _CrearCompetenciaState extends State<CrearCompetencia> {
  CompetitionData competitionData = CompetitionData();
  List<String> categorias = ['Pre-peneca', 'Peneca', 'Infantil', 'Juvenil'];
  List<String> competencias = [
    'Salto Alto',
    'Salto Triple',
    'Lanzamiento Bala',
    'Lanzamiento Jabalina',
    'Lanzamiento Pelotita',
    'Lanzamiento Disco'
  ];

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              const Text(
                'Datos del campeonato',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 40.0),

              // Nombre del campeonato
              SizedBox(
                width: 300,
                child: TextFormField(
                  onChanged: (value) => competitionData.name = value,
                  decoration: const InputDecoration(
                    labelText: 'Nombre Campeonato',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Fecha del campeonato
              SizedBox(
                width: 300,
                child: TextFormField(
                  onChanged: (value) => competitionData.date = value,
                  decoration: const InputDecoration(
                    labelText: 'Fecha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // CheckBoxs categorías
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCheckboxMenu(
                    options: categorias,
                    selectedOptions: competitionData.selectedCategories,
                    customText: 'Selecciona tus Categorias',
                  ),
                ],
              ),

              const SizedBox(height: 10.0),

              // CheckBoxs Competencia
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCheckboxMenu(
                    options: competencias,
                    selectedOptions: competitionData.selectedCompetitions,
                    customText: 'Selecciona tus Competencias',
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Horario(competitionData: competitionData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text('Crear Horario',
                    style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 20.0),

              // Botón Crear Competencia
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmación'),
                        content: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Nombre del campeonato:'),
                                const SizedBox(height: 10.0),
                                Text(competitionData.name),
                                const SizedBox(height: 20.0),
                                const Text('Fecha:'),
                                const SizedBox(height: 10.0),
                                Text(competitionData.date),
                                const SizedBox(height: 20.0),
                                const Text('Categorías:'),
                                if (competitionData
                                    .selectedCategories.isNotEmpty)
                                  ...competitionData.selectedCategories
                                      .map((category) => Text('- $category'))
                                else
                                  const Text(
                                      'No se han seleccionado categorías.'),
                                const SizedBox(height: 20.0),
                                const Text('Competencias:'),
                                if (competitionData
                                    .selectedCompetitions.isNotEmpty)
                                  ...competitionData.selectedCompetitions.map(
                                      (competition) => Text('- $competition'))
                                else
                                  const Text(
                                      'No se han seleccionado competencias.'),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('NO'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyApp(competitionData: competitionData),
                                ),
                              );
                            },
                            child: const Text('SI'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text('Crear Competencia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
