import 'dart:math';

import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo caderno',
      value: 31.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta internet',
      value: 12000.129,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta 1',
      value: 19.199,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta 2',
      value: 12.10,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta 3',
      value: 120.129,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta 4',
      value: 19.199,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Conta 5',
      value: 12.10,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: 'Conta 6',
      value: 120.129,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
