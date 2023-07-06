
import 'package:flutter_dictionary_app/domain/datasources/words_datasource.dart';
import 'package:flutter_dictionary_app/domain/entities/word.dart';
import 'package:flutter_dictionary_app/domain/repositories/words_repository.dart';

class WordsRepositoryImpl extends WordsRepository {

  final WordsDatasource datasource;

  WordsRepositoryImpl(this.datasource);
  
  @override
  Future<Word> getWordByString(String searchParameter) {
    return datasource.getWordByString(searchParameter);
  }

}