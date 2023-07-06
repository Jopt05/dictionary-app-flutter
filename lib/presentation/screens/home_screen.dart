import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/domain/entities/word.dart';
import 'package:flutter_dictionary_app/presentation/providers/theme_provider.dart';
import 'package:flutter_dictionary_app/presentation/providers/words/words_provider.dart';
import 'package:flutter_dictionary_app/presentation/screens/widgets/home/meaning_container.dart';
import 'package:flutter_dictionary_app/presentation/screens/widgets/home/separator.dart';
import 'package:flutter_dictionary_app/presentation/screens/widgets/home/source_container.dart';
import 'package:flutter_dictionary_app/presentation/screens/widgets/home/details_container.dart';
import 'package:flutter_dictionary_app/presentation/screens/widgets/home/word_presentation.dart';
import 'package:flutter_dictionary_app/presentation/screens/widgets/shared/search_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homeview extends ConsumerWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch( themeNotifierProvider ).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary'),
        leading: const Icon(
          Icons.book
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: VerticalDivider(),
          ),
          const SizedBox(
            width: 20,
          ),
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              ref.read( themeNotifierProvider.notifier ).toggleDarkmode();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            isDarkMode
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: const _Homebody(),
    );
  }
}

class _Homebody extends StatelessWidget {
  const _Homebody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            SearchBox(
              onValue: (value) {
                print(value);
              },
            ),
            
            const SizedBox(
              height: 45,
            ),

            const _Wordview(),
          ],
        ),
      ),
    );
  }
}

class _Wordview extends ConsumerStatefulWidget {
  const _Wordview({
    super.key,
  });

  @override
  _WordviewState createState() => _WordviewState();
}

class _WordviewState extends ConsumerState<_Wordview> {

  @override
  void initState() {
    
    ref.read( wordsProvider.notifier ).loadWord("man");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Word? wordData = ref.watch( wordsProvider )["man"];

    final size = MediaQuery.of(context).size;

    if ( wordData == null) return Center(
      child: CircularProgressIndicator(),
    );

    return Column(
      children: [

        WordPresentation(
          word: wordData.word,
          phonetics: wordData.phonetics,
        ),
        const SizedBox(
          height: 20,
        ),
        ...wordData.meanings.map(
          (e) => DetailsContainer(meaning: e),
        ),
        // Separation 
        Row(
          children: [
            Container(
              width: size.width * 0.8,
              child: const Divider(
                height: 2,
                color: Colors.grey,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SourceContainer(

        ),
      ],
    );
  }
}