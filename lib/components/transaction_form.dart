import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, String) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateController =
      TextEditingController(text: DateFormat('dd/MM/y').format(DateTime.now()));

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text.replaceAll(",", "."));
    final date = _dateController.text;

    if (title.isEmpty || value == null) {
      return;
    }
    widget.onSubmit(title, value, date);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _dateController.text = DateFormat('dd/MM/y').format(pickedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  icon: Icon(Icons.receipt),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _valueController,
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  icon: Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller:
                    _dateController, //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Selecione uma data" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: _showDatePicker,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    child: const Text('Adicionar Transação'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
