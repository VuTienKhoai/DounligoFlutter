import 'package:duolingo/components/header/accumulate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Accumulate(iconPath: 'assets/icons/icon_duoHeader.svg'),
          Accumulate(
            iconPath: 'assets/icons/icon_streak.svg',
            quantity: '1',
            color: const Color(0xFFFB9705),
            onTap: () => Navigator.pushNamed(context, '/streak'),
          ),
          Accumulate(
            iconPath: 'assets/icons/icon_diamond.svg',
            quantity: '1',
            color: const Color(0xFF1CB0F6),
          ),
          Accumulate(
            iconPath: 'assets/icons/icon_heart.svg',
            quantity: '1',
            color: const Color(0xFFF35051),
          ),
        ],
      ),
    );
  }
}
