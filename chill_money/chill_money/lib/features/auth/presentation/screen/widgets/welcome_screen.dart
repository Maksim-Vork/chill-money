import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.savings, color: Color.fromARGB(255, 0, 208, 49), size: 35),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
