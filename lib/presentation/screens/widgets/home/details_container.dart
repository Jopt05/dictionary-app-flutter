import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/infrastructure/models/api_response.dart';
import 'package:flutter_dictionary_app/presentation/providers/words/search_provider.dart';
import 'package:flutter_dictionary_app/presentation/providers/words/words_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsContainer extends ConsumerWidget {

  final Meaning meaning;

  const DetailsContainer({
    required this.meaning
  });

  final String placeholder_text = "Alejandro G. Calvo te cuenta qué le ha parecido 'Misión imposible: Sentencia mortal, parte 1' ('Mission: Impossible - Dead Reckoning' Part One), la séptima entrega de la saga Misión Imposible protagonizada por Tom Cruise y Rebecca Ferguson y dirigida por Christopher McQuarrie.";

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [

          // Separator 
          Row(
            children: [
              Text(
                meaning.partOfSpeech,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                width: size.width * 0.5,
                child: const Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              )
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          
          // Details 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text( 
                'Meaning',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // Definitions 
              ...meaning.definitions.map(
                (element) {
                  final index = meaning.definitions.indexOf(element);
                  if ( index <= 2 ) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "\u2022",
                          style: TextStyle(
                            fontSize: 30
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element.definition, 
                                style: const TextStyle(
                                  fontSize: 20
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              // Examples
                              if ( element.example != null && meaning.partOfSpeech != "noun" ) Text(
                                element.example!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 94, 91, 91)
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )
                        ),
                      ],
                    );
                  }

                  return const SizedBox();
                },
              ),

              // Synonyms
              if ( meaning.partOfSpeech == "noun" ) Wrap(
                children: [
                  const Text(
                    'Synonyms',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  ...meaning.synonyms.map(
                    (element) {
                      return Wrap(
                          children: [
                          GestureDetector(
                            onTap: () {
                              ref.read( wordsProvider.notifier ).loadWord(searchParameter: element);
                              ref.read( searchProvider.notifier ).state = element;
                            },
                            child: Text(
                              element,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 169, 78, 185),
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          )
                        ] 
                      );
                    }
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}