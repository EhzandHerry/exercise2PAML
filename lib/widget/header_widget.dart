import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("RM Ramadhan", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 25,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDbs5UxXTL5Uiqfq5v_ExpWgj9c6BByY5TTg&usqp=CAU"),          
          radius: 70,
        )
      ],
    );
  }
}