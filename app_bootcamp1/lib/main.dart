import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner de Viagem',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Planner de Viagem'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedCountry;
  bool acceptTerms = false;

  bool includeInsurance = false;
  bool includeTransfers = false;
  bool includeMeals = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Planner de Viagem",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                const Text('Prencha o formulário', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome Completo',
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Quantas pessoas participarão da viagem?',
                  ),
                ),
                RadioListTile<String>(
                  title: const Row(
                    children: [
                      Icon(Icons.flag),
                      SizedBox(width: 10),
                      Text("Alemanha"),
                    ],
                  ),
                  value: "Alemanha",
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Row(
                    children: [
                      Icon(Icons.flag),
                      SizedBox(width: 10),
                      Text("Grécia"),
                    ],
                  ),
                  value: "Grécia",
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Row(
                    children: [
                      Icon(Icons.flag),
                      SizedBox(width: 10),
                      Text("Holanda"),
                    ],
                  ),
                  value: "Holanda",
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
                ListTile(
                  title: const Text('Data de ida'),
                  subtitle: const Text('Selecione uma data'),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 60)),
                      );
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Data de volta'),
                  subtitle: const Text('Selecione uma data'),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 60)),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Serviços adicionais', style: TextStyle(fontSize: 18)),

                CheckboxListTile(
                  title: const Text("Incluir seguro de viagem"),
                  value: includeInsurance,
                  onChanged: (value) {
                    setState(() {
                      includeInsurance = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Incluir transfer do aeroporto"),
                  value: includeTransfers,
                  onChanged: (value) {
                    setState(() {
                      includeTransfers = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Incluir refeições"),
                  value: includeMeals,
                  onChanged: (value) {
                    setState(() {
                      includeMeals = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Checkbox(
                      value: acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          acceptTerms = value ?? false;
                        });
                      },
                    ),
                    const Text("Aceito os termos e condições"),
                  ],
                ),
                
                ElevatedButton(
                  onPressed: () {
                    if (!acceptTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Você deve aceitar os termos para continuar."),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Formulário enviado com sucesso!\n"
                            "País selecionado: $selectedCountry\n"
                            "Seguro: ${includeInsurance ? 'Sim' : 'Não'}\n"
                            "Transfer: ${includeTransfers ? 'Sim' : 'Não'}\n"
                            "Refeições: ${includeMeals ? 'Sim' : 'Não'}",
                          ),
                        ),
                      );
                    }
                  },

                  child: const Text("Enviar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
