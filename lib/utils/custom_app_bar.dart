import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
