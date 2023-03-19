import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text.replaceAll(",", "."));

    if (title.isEmpty || value == null) {
      print('empty');
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _submitForm,
                      child: const Text('Adicionar')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
