import 'package:flutter_dictionary_app/infrastructure/models/api_response.dart';

class Word {
  final String word;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  final License license;
  final List<String> sourceUrls;

  Word(
      {required this.word,
      required this.phonetics,
      required this.meanings,
      required this.license,
      required this.sourceUrls});
}
