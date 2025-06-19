import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyTabBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context).size;

    return Container(
      height: layout.height * 0.1,
      color: Colors.white,
      child: Row(
        children: List.generate(3, (index) {
          final isFocused = currentIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                padding: EdgeInsets.only(bottom: layout.height * 0.01),
                alignment: Alignment.center,
                child: Container(
                  width: layout.width * 0.08,
                  height: layout.width * 0.09,
                  padding: EdgeInsets.all(layout.width * 0.06),
                  decoration: BoxDecoration(
                    color: isFocused
                        ? const Color(0xFF58CC02)
                        : Colors.transparent, // BACKGROUND_BUTTON
                    borderRadius: BorderRadius.circular(layout.width * 0.04),
                    border: Border.all(
                      color: isFocused
                          ? const Color(0xFF58A700)
                          : Colors.transparent, // BORDER_BUTTON
                      width: layout.width * 0.002,
                    ),
                  ),
                  child: Icon(
                    _getTabIcon(index),
                    color: isFocused ? Colors.white : Colors.grey,
                    size: layout.width * 0.06,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  IconData _getTabIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.book;
      case 2:
        return Icons.person;
      default:
        return Icons.help_outline;
    }
  }
}
