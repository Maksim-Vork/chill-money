import 'package:flutter/material.dart';

class Expense {
  final String name;
  final String amount;
  final Color color;

  Expense({required this.name, required this.amount, required this.color});

  Widget buildWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        title: Row(
          children: [
            Icon(Icons.savings, color: Color.fromARGB(255, 0, 208, 49)),
            SizedBox(width: 8),
            Text(
              'Chill Money',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 208, 49),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 67, 67, 67),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 29, horizontal: 19),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 58, 58, 58),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 13),
                        child: Column(
                          children: [
                            Expense(
                                    name: 'Продукты',
                                    amount: '50',
                                    color: Colors.red)
                                .buildWidget(),
                            Expense(
                                    name: 'Зарплата',
                                    amount: '400',
                                    color: Colors.green)
                                .buildWidget(),
                            Expense(
                                    name: 'Продукты',
                                    amount: '230',
                                    color: Colors.red)
                                .buildWidget(),
                            Expense(
                                    name: 'Перевод',
                                    amount: '500',
                                    color: Colors.green)
                                .buildWidget(),
                            Expense(
                                    name: 'Услуги',
                                    amount: '50',
                                    color: Colors.red)
                                .buildWidget(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Веди учет затрат в одном месте',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              color: index == 0 ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 0, 208, 49),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 46, vertical: 13),
                child: Text('Зарегистрироваться'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Войти', style: TextStyle(color: Colors.white)),
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(color: Color.fromARGB(255, 114, 114, 144)),
            ),
          ],
        ),
      ),
    );
  }
}
