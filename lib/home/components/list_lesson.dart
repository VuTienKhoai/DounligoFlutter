import 'package:duolingo/components/button_lesson.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ListLesson extends StatelessWidget {
  final List<Map<String, dynamic>> listLesson;

  const ListLesson({super.key, required this.listLesson});

  // Hàm tính dịch chuyển ngang (x) theo index (hiệu ứng wave)
  double getTranslateX(int index, int total) {
    if (index == 0 || index == total - 1) return 0;
    final waveOffsets = [0.0, 0.08, 0.16, 0.08, 0.0, -0.08, -0.16];
    final waveIndex = index % waveOffsets.length;
    return waveOffsets[waveIndex];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: listLesson.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final translateX =
            screenWidth * getTranslateX(index, listLesson.length);

        return Transform.translate(
          offset: Offset(translateX, 0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: ButtonLesson(status: item['status']),
          ),
        );
      }).toList(),
    );
  }
}
