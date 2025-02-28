import 'package:chillmoney/screens/current_budgets/current_budgets.dart';

import 'package:chillmoney/screens/home/home_screen.dart';
import 'package:chillmoney/screens/oparation/history_operation.dart';
import 'package:chillmoney/screens/profile/profile_screen.dart';
import 'package:chillmoney/data/transactions.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  final TransactionsService transactionsService = TransactionsService();

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      HomeScreen(transactionsService: transactionsService),
      HistoryOperation(transactionsService: transactionsService),
      CurrentBudgets(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    if (index >= 0 && index < screens.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 81, 81, 81),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 179, 179, 179),
        iconSize: 30,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
