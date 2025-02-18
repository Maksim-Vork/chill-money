import 'package:flutter/material.dart';

class CurrentBudgets extends StatefulWidget {
  const CurrentBudgets({super.key});

  @override
  State<CurrentBudgets> createState() => _CurrentBudgetsState();
}

class _CurrentBudgetsState extends State<CurrentBudgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        title: Text(
          'Текущие бюджеты',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
