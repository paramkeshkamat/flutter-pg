import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Hello",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, fontFamily: "Roboto"),
        ),
        // CustomText("Hellsso"),
        // CustomText("Hello"),
        // CustomText("Hello"),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;

  const CustomText(String s, {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
