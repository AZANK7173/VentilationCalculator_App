import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final String title;

  const MyAppBar({
    required this.onPressed1,
    required this.onPressed2,
    this.title = "Ventilation Calculator",
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onPressed1,
      ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: onPressed2,
        ),
      ],
    );
  }
}
