import 'package:flutter/material.dart';

class ButtonLesson extends StatelessWidget {
  final String status;

  const ButtonLesson({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'active';

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey.shade300,
        shape: BoxShape.circle,
        boxShadow: [
          if (isActive)
            const BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        status.substring(0, 1).toUpperCase(),
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
