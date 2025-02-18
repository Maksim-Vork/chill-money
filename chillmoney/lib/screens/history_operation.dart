import 'package:flutter/material.dart';

class HistoryOperation extends StatefulWidget {
  const HistoryOperation({super.key});

  @override
  State<HistoryOperation> createState() => _HistoryOperationState();
}

class _HistoryOperationState extends State<HistoryOperation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        title: Text(
          'История операций',
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
    );
  }
}
