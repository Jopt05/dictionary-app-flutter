import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        const Text(
          'Noun',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 40),
          width: size.width * 0.62,
          child: const Divider(
            height: 2,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}