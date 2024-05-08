import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key, required this.onPressedNext});
  final VoidCallback onPressedNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
          onPressed: onPressedNext,
          child: Text(
            "Next",
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
