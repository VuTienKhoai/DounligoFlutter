import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Accumulate extends StatelessWidget {
  final String iconPath;
  final String? quantity;
  final Color? color;
  final VoidCallback? onTap;

  const Accumulate({
    super.key,
    required this.iconPath,
    this.quantity,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(iconPath, width: 36, height: 36),
          if (quantity != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: color ?? Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                quantity!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
