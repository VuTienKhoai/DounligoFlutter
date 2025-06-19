import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedIntroBlock extends StatelessWidget {
  final String message;
  final String gifUrl;
  final String buttonText;
  final VoidCallback? onPress;

  const AnimatedIntroBlock({
    super.key,
    required this.message,
    required this.gifUrl,
    required this.buttonText,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Message box
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          ).animate().fadeIn(duration: 800.ms).moveY(begin: -30, end: 0),

          // GIF Image
          Image.network(gifUrl, width: 300, height: 300, fit: BoxFit.contain)
              .animate()
              .fadeIn(duration: 1000.ms)
              .scale(begin: const Offset(0.9, 0.9)),

          // Divider
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            height: 1,
            width: double.infinity,
            color: const Color(0xFFE5E5E5),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: onPress ?? () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF58CC02),
                shadowColor: const Color(0xFF58A700),
                elevation: 5,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 80,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Color(0xFF58CC02), width: 2),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ).animate().fadeIn(duration: 1000.ms).moveY(begin: 30, end: 0),
          ),
        ],
      ),
    );
  }
}
