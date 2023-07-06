import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/infrastructure/models/api_response.dart';

class WordPresentation extends StatefulWidget {

  final String word;
  final List<Phonetic> phonetics;
  static AudioPlayer player = AudioPlayer();


  const WordPresentation({
    super.key,
    required this.word,
    required this.phonetics,
  });

  @override
  State<WordPresentation> createState() => _WordPresentationState();
}

class _WordPresentationState extends State<WordPresentation> {

  static bool isPlaying = false;

  Future<void> playAudio( String source ) async {
    setState(() {
      isPlaying = true;
    });
    await WordPresentation.player.play(UrlSource(source));
    Future.delayed(
      const Duration( seconds: 1 ),
      () => setState(() {
        isPlaying = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {

    if ( widget.phonetics.length == 0 ) return SizedBox();

    final Phonetic usedPhonetic = widget.phonetics[0];

    return Row(
      children: [
        Column(
          children: [
            Text(
              widget.word.toString().toUpperCase(),
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
        if ( usedPhonetic.audio != "" ) GestureDetector(
          onTap: () {
            playAudio(usedPhonetic.audio);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              color: isPlaying ? Color.fromARGB(255, 133, 76, 143) : const Color.fromARGB(255, 203, 151, 212),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ],
    );
  }
}