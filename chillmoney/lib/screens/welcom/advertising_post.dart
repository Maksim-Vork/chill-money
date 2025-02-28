import 'package:flutter/material.dart';

class Expense {
  final String name;
  final String amount;
  final Color color;

  Expense({required this.name, required this.amount, required this.color});

  Widget buildWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
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
              SizedBox(width: 15),
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

class AdvertisingPost extends StatelessWidget {
  const AdvertisingPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 58, 58, 58),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 13),
            child: Column(
              children: [
                Expense(name: 'Продукты', amount: '50', color: Colors.red)
                    .buildWidget(),
                Expense(name: 'Зарплата', amount: '400', color: Colors.green)
                    .buildWidget(),
                Expense(name: 'Продукты', amount: '230', color: Colors.red)
                    .buildWidget(),
                Expense(name: 'Перевод', amount: '500', color: Colors.green)
                    .buildWidget(),
                Expense(name: 'Услуги', amount: '50', color: Colors.red)
                    .buildWidget(),
                Expense(name: 'Зарплата', amount: '400', color: Colors.green)
                    .buildWidget(),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
        Text(
          'Веди учет затрат в одном месте',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
