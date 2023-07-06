
import 'package:dio/dio.dart';
import 'package:flutter_dictionary_app/domain/datasources/words_datasource.dart';
import 'package:flutter_dictionary_app/domain/entities/word.dart';
import 'package:flutter_dictionary_app/infrastructure/mappers/word_mapper.dart';
import 'package:flutter_dictionary_app/infrastructure/models/api_response.dart';

class WordsApiDatasource extends WordsDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.dictionaryapi.dev/api/v2/entries/en",
    )
  );

  @override
  Future<Word> getWordByString(String searchParameter) async {

    final response = await dio.get(
      "/$searchParameter"
    );

    final apiResponse = ApiResponse.fromJson(response.data[0]);

    final Word word = WordMapper.apiResponseToEntity(apiResponse);

    return word;

  }

}