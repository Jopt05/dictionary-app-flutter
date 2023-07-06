
import 'package:flutter_dictionary_app/domain/entities/word.dart';
import 'package:flutter_dictionary_app/presentation/providers/words/words_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wordsProvider = StateNotifierProvider<WordsNotifier, Map<String, Word>>(
  (ref) {
    final fetchWord = ref.watch( wordsRepositoryProvider ).getWordByString;
    return WordsNotifier(
      fetchWord: fetchWord
    );
  }
);

typedef WordCallback = Future<Word> Function(String searchParameter );

class WordsNotifier extends StateNotifier<Map<String, Word>> {

  WordCallback fetchWord;
  bool isLoading = false;

  WordsNotifier({
    required this.fetchWord
  }): super({});

  Future<void> loadWord({ String searchParameter = "hello" }) async {
    isLoading = true;

    final Word word = await fetchWord(searchParameter);

    state = {
      ...state,
      searchParameter: word
    };

    isLoading = false;
  }

}