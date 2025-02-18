import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 51, 51, 51),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.savings,
                    color: Color.fromARGB(255, 0, 208, 49),
                    size: 35,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Chill Money',
                    style: TextStyle(
                      color: Color.fromARGB(255, 67, 255, 111),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.search, color: Colors.white, size: 30),
                  SizedBox(width: 20),
                  Icon(Icons.notifications, color: Colors.white, size: 30),
                ],
              ),
            ],
          ),
        ));
  }
}
