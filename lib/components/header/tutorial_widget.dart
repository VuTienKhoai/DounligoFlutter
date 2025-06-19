import 'package:flutter/material.dart';

class TutorialWidget extends StatelessWidget {
  final String? linkImg; // URL ảnh
  final String text;

  const TutorialWidget({super.key, this.linkImg, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (linkImg != null)
            Image.network(linkImg!, width: 90, height: 90, fit: BoxFit.cover),
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
              ),
              child: Text(
                text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Color(0xFF333333)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
