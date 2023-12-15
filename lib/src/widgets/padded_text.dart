import 'package:flutter/material.dart';

class CustomTextSection extends StatelessWidget {
  final String text;
  final double spacing;
  final TextStyle style;
  // final TextAlign textAlign;

  const CustomTextSection({
    Key? key,
    required this.text,
    this.spacing = 10.0,
    this.style = const TextStyle(fontSize: 16,),
    // this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing),
        Text(
          text,
          textAlign: TextAlign.center,
          style: style,
        ),
      ],
    );
  }
}