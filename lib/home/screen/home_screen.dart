import 'package:duolingo/components/button/button_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:duolingo/assets/svg/icon_tab_navigation/icon_book.dart';
import 'package:duolingo/home/components/content_home.dart';
import 'package:duolingo/home/components/header_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? currentTopic;

  void handleNavigateHome() {
    Navigator.pushNamed(context, '/ProgressTopic');
  }

  void handleNavigateConversationLesson() {
    Navigator.pushNamed(context, '/ConversationLesson');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const HeaderHome(),
              const SizedBox(height: 20),

              // Nếu bạn muốn hiển thị button topic (hiện đang bị comment trong React Native)
              ButtonTopic(
                itemNumberTopic: "PHẦN 1, CỬA 1",
                nameTopic: currentTopic?["nameTopic"] ?? "",
                iconBookAsset: iconBook,
                onPressTopic: handleNavigateHome,
                onPressLesson: handleNavigateConversationLesson,
              ),

              const SizedBox(height: 20),
              Expanded(
                child: ContentHome(
                  setCurrentTopic: (topic) {
                    setState(() {
                      currentTopic = topic;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
