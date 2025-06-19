import 'package:duolingo/dataFake/data_lesson.dart';
import 'package:flutter/material.dart';
import 'list_lesson.dart';

class ContentHome extends StatefulWidget {
  final Function(Map<String, dynamic>) setCurrentTopic;

  const ContentHome({super.key, required this.setCurrentTopic});

  @override
  State<ContentHome> createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (dataLesson.isNotEmpty) {
      widget.setCurrentTopic(dataLesson[0]);
    }
  }

  void _onItemVisible(Map<String, dynamic> topic) {
    widget.setCurrentTopic(topic);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(top: 30, bottom: 100),
      itemCount: dataLesson.length,
      itemBuilder: (context, index) {
        final topic = dataLesson[index];

        // Gọi setCurrentTopic khi widget này cuộn tới
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              _onItemVisible(topic);
            }
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4EB602),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      topic['nameTopic'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ListLesson(listLesson: topic['listLessons'] ?? []),
              ],
            ),
          ),
        );
      },
    );
  }
}
