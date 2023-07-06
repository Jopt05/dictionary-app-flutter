
import 'package:flutter_dictionary_app/domain/entities/word.dart';

abstract class WordsDatasource {
  // Define los métodos que éstas clases tendrán para traer la info

  Future<Word> getWordByString(String searchParameter);

}