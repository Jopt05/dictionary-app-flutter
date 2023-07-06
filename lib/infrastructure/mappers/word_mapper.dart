import 'package:flutter_dictionary_app/domain/entities/word.dart';
import 'package:flutter_dictionary_app/infrastructure/models/api_response.dart';

class WordMapper {
  static Word apiResponseToEntity(ApiResponse response) {

    return Word(
        word: response.word,
        phonetics: response.phonetics,
        meanings: response.meanings,
        license: response.license,
        sourceUrls: response.sourceUrls
        );
  }
}
