import 'package:flutter/material.dart';

class MeaningContainer extends StatelessWidget {
  const MeaningContainer({super.key});

  @override
  Widget build(BuildContext context) {

    final String placeholder_text = "Alejandro G. Calvo te cuenta qué le ha parecido 'Misión imposible: Sentencia mortal, parte 1' ('Mission: Impossible - Dead Reckoning' Part One), la séptima entrega de la saga Misión Imposible protagonizada por Tom Cruise y Rebecca Ferguson y dirigida por Christopher McQuarrie.";
    
    return SizedBox(
      width: double.infinity,
      child: Column(
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
            height: 20,
          ),

          Row(
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
                child: Text(
                  '$placeholder_text', 
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          //Synonyms
          const Row(
            children: [
              Text(
                'Synonyms',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
                ),
              ),

              SizedBox(
                width: 20,
              ),

              Text(
                'electronic keyboard',
                style: TextStyle(
                  color: Color.fromARGB(255, 169, 78, 185),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}