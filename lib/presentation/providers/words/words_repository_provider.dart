

import 'package:flutter_dictionary_app/infrastructure/datasources/words_datasource.dart';
import 'package:flutter_dictionary_app/infrastructure/repository/words_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wordsRepositoryProvider = Provider(
  (ref) {
    return WordsRepositoryImpl( WordsApiDatasource() );
  }
);