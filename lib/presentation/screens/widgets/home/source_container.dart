import 'package:flutter/material.dart';

class SourceContainer extends StatelessWidget {

  final String url;

  const SourceContainer({super.key, required this.url});
  

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

          Wrap(
            children: [
              InkWell(
                onTap: () => url,
                child: Text(
                  url,
                  style: TextStyle(
                    color: Colors.grey[650],
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                  maxLines: 2,
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