import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_bloc.dart';
import 'package:chill_money/features/transactions/presentation/bloc/transact_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOperation extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  const AddOperation({super.key});

  @override
  State<AddOperation> createState() => _AddOperationState();
}

class _AddOperationState extends State<AddOperation> {
  bool selectedType = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerNameTransaction =
      TextEditingController();
  final TextEditingController _controllerSum = TextEditingController();
  String? _validatorNameBudgets(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введено некоректное название';
    } else if (_controllerNameTransaction.text.length > 15) {
      return "Название слишком большое";
    } else {
      return null;
    }
  }

  String? _validatorTotalAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите число';
    }
    final int? amount = int.tryParse(value);
    if (amount == null) {
      return 'Введите корректное число';
    } else if (amount < 1) {
      return 'Число должно быть положительное';
    }
    return null;
  }

  void _formmValidator() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      BlocProvider.of<TransactBloc>(context).add(
        AddTransactionEvent(
          transact: Transact(
            name: _controllerNameTransaction.text,
            isSpend: selectedType,
            sum: int.parse(_controllerSum.text),
            date: DateTime.now(),
          ),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey, height: 1.0),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        title: Text(
          'Создание транзакции',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 67, 67, 67),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'Новая транзакция',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 60),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: _validatorNameBudgets,
                              controller: _controllerNameTransaction,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Название транзакции',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(150, 150, 150, 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              validator: _validatorTotalAmount,
                              controller: _controllerSum,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Сумма транзакции',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(150, 150, 150, 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: (selectedType)
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            255,
                                            147,
                                            147,
                                            147,
                                          ),
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedType = true;
                                    });
                                  },
                                  child: Text('Трата'),
                                ),
                                SizedBox(width: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: (selectedType)
                                        ? const Color.fromARGB(
                                            255,
                                            147,
                                            147,
                                            147,
                                          )
                                        : const Color.fromARGB(255, 0, 208, 49),
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedType = false;
                                    });
                                  },
                                  child: Text('Получение'),
                                ),
                              ],
                            ),
                            SizedBox(height: 55),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromARGB(
                                  255,
                                  0,
                                  208,
                                  49,
                                ),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                _formmValidator();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 85,
                                  vertical: 15,
                                ),
                                child: Text(
                                  'Создать',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
