import 'package:flutter/material.dart';
import 'pessoa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  String _resultado = "";

  void _calcularIMC() {
    if (_formKey.currentState!.validate()) {
      String nome = _nomeController.text;
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text);

      Pessoa pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
      double imc = pessoa.calcularIMC();

      setState(() {
        _resultado = "${pessoa.nome}, seu IMC é ${imc.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pesoController,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu peso';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alturaController,
                decoration: InputDecoration(labelText: 'Altura (m)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua altura';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularIMC,
                child: Text('Calcular IMC'),
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
