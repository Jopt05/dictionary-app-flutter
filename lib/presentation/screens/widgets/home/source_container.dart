import 'package:flutter/material.dart';

class SourceContainer extends StatelessWidget {
  const SourceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Source',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 20
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Text(
                'https//:adsadasdas.com/word',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontSize: 20
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              const Icon(
                Icons.output_outlined
              )
            ],
          )
        ],
      ),
    );
  }
}