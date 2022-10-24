import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem(
      {Key? key,
      required this.info,
      required this.title,
      this.animated = false})
      : super(key: key);

  final String info;
  final String title;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          if (!animated)
            Text(info,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(info,
                      speed: const Duration(milliseconds: 500),
                      textStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                ]),
              ],
            ),
        ],
      ),
    );
  }
}
