import 'dart:io';

import 'package:flutter/material.dart';

import '../Classes/cup.dart';

class CupCard extends StatelessWidget {
  const CupCard({
    super.key,
    required this.imagePath,
    required this.size,
  });

  final String imagePath;
  final Sizes size;

  @override
  Widget build(BuildContext context) {
    //Column with image and size label
    return Column(
      children: [
        Expanded(
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          size.toString().split('.').last,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );

    //   return Container(
    //     margin: const EdgeInsets.all(10),
    //     child: Image.file(
    //       File(imagePath),
    //       fit: BoxFit.cover,
    //     ),
    //   );
  }
}
