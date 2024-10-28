import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final double size;
  final Icon icon;
  const CircleButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.size = 50,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(icon.icon, color: Colors.white),
        ),
      ),
    );
  }
}