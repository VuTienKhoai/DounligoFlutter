import 'package:flutter/material.dart';

class RenderLessonsZigZag extends StatelessWidget {
  final List<Map<String, dynamic>> lessons;

  const RenderLessonsZigZag({super.key, required this.lessons});

  Widget renderNode(Map<String, dynamic> lesson, String position) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: position == "center"
              ? Colors.green.shade300
              : Colors.blue.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            lesson['title'] ?? 'Lesson',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    for (int i = 0; i < lessons.length; i += 3) {
      final group = lessons.sublist(
        i,
        (i + 3 < lessons.length) ? i + 3 : lessons.length,
      );

      // Center row
      if (group.isNotEmpty) {
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ), // Spacer
              Expanded(child: renderNode(group[0], "center")),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ), // Spacer
            ],
          ),
        );
      }

      // Left & Right row
      if (group.length > 1 || group.length > 2) {
        rows.add(
          Row(
            children: [
              group.length > 1
                  ? renderNode(group[1], "left")
                  : const Expanded(child: SizedBox()),
              group.length > 2
                  ? renderNode(group[2], "right")
                  : const Expanded(child: SizedBox()),
            ],
          ),
        );
      }
    }

    return Column(children: rows);
  }
}
