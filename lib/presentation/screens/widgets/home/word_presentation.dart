import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/infrastructure/models/api_response.dart';

class WordPresentation extends StatelessWidget {

  final String word;
  final List<Phonetic> phonetics;

  const WordPresentation({
    super.key,
    required this.word,
    required this.phonetics
  });

  @override
  Widget build(BuildContext context) {

    final Phonetic usedPhonetic = phonetics[0];

    return Row(
      children: [
        Column(
          children: [
            Text(
              word.toString().toUpperCase(),
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold
              ),
            ),
            if ( usedPhonetic.text != null ) Text(
              usedPhonetic.text!,
              style: const TextStyle(
                fontSize: 26,
                fontStyle: FontStyle.italic,
                color: Colors.purple
              ),
            )
          ],
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 60,
            height: 60,
            color: const Color.fromARGB(255, 203, 151, 212),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}