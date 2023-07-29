// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.teal),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
