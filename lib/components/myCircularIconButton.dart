import 'package:flutter/material.dart';

class MyCircluarIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  MyCircluarIconButton(
      {required this.onPressed, required this.icon, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
    );
  }
}
