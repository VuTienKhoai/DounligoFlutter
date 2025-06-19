import 'package:flutter/material.dart';

class HeaderLesson extends StatefulWidget {
  final String? iconSvg; // Nếu bạn dùng flutter_svg
  final double percent;
  final VoidCallback? onPressGoBack;
  final Color colorProgressBar;

  const HeaderLesson({
    super.key,
    this.iconSvg,
    this.percent = 0.5,
    this.onPressGoBack,
    this.colorProgressBar = Colors.green,
  });

  @override
  State<HeaderLesson> createState() => _HeaderLessonState();
}

class _HeaderLessonState extends State<HeaderLesson>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.percent,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant HeaderLesson oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: widget.percent,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ), // hoặc dùng SVG nếu bạn có iconSvg
            onPressed: widget.onPressGoBack ?? () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
          AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return Container(
                width: screenWidth - 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _progressAnimation.value.clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.colorProgressBar,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
