import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text.replaceAll(",", "."));

    if (title.isEmpty || value == null) {
      print('empty');
      return;
    }

    widget.onSubmit(title, value);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _valueController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada!'
                          : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 214, 214, 214)),
                        foregroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 63, 63, 63))),
                    onPressed: _showDatePicker,
                    child: const Text(
                      'Selecionar uma data.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(MyApp()); 
// }

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "Test App",
//         home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return _HomePage();
//   }
// }

// class _HomePage extends State<HomePage>{
//   TextEditingController dateinput = TextEditingController(); 
//   //text editing controller for text field
  
//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title:Text("DatePicker on TextField"), 
//             backgroundColor: Colors.redAccent, //background color of app bar
//         ),
//         body:Container(
//           padding: EdgeInsets.all(15),
//           height:150,
//           child:Center( 
//              child:TextField(
//                 controller: dateinput, //editing controller of this TextField
//                 decoration: InputDecoration( 
//                    icon: Icon(Icons.calendar_today), //icon of text field
//                    labelText: "Enter Date" //label text of field
//                 ),
//                 readOnly: true,  //set it true, so that user will not able to edit text
//                 onTap: () async {
//                   DateTime pickedDate = await showDatePicker(
//                       context: context, initialDate: DateTime.now(),
//                       firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
//                       lastDate: DateTime(2101)
//                   );
                  
//                   if(pickedDate != null ){
//                       print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
//                       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
//                       print(formattedDate); //formatted date output using intl package =>  2021-03-16
//                         //you can implement different kind of Date Format here according to your requirement

//                       setState(() {
//                          dateinput.text = formattedDate; //set output date to TextField value. 
//                       });
//                   }else{
//                       print("Date is not selected");
//                   }
//                 },
//              )
//           )
//         )
//     );
//   }
// }