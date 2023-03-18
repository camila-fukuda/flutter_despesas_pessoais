import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo caderno',
      value: 31.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Conta internet',
      value: 112.50,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico dias da semana.'),
            ),
          ),
          Card(
            child: Text('Lista de transações.'),
          )
        ],
      ),
    );
  }
}
