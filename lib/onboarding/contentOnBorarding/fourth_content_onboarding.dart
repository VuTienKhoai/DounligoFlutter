import 'package:duolingo/components/button/button_target.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FourthContentOnBoarding extends StatefulWidget {
  const FourthContentOnBoarding({super.key});

  @override
  State<FourthContentOnBoarding> createState() =>
      _FourthContentOnBoardingState();
}

class _FourthContentOnBoardingState extends State<FourthContentOnBoarding> {
  int? selectedTarget;

  final List<Map<String, dynamic>> dataTarget = [
    {'id': 1, 'textleft': '3 phút / ngày', 'textright': 'Dễ'},
    {'id': 2, 'textleft': '10 phút / ngày', 'textright': 'Vừa'},
    {'id': 3, 'textleft': '15 phút / ngày', 'textright': 'Khó'},
    {'id': 4, 'textleft': '30 phút / ngày', 'textright': 'Siêu khó'},
  ];

  void handleSelected(int id) {
    setState(() {
      selectedTarget = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: dataTarget.map((item) {
          return Animate(
            key: ValueKey(
              item['id'],
            ), // Giúp Flutter nhận diện widget khi rebuild
            effects: const [FadeEffect(), SlideEffect()],
            child: BtnTarget(
              textLeft: item['textleft'] ?? '',
              textRight: item['textright'] ?? '',
              colorTextInactive: Colors.black, // hoặc Colors.grey
              status: selectedTarget == item['id'],
              onPress: () => handleSelected(item['id']),
            ),
          );
        }).toList(),
      ),
    );
  }
}
