import 'dart:io';

import 'package:flutter/material.dart';

import '../../../models/cup.dart';

class CupCard extends StatelessWidget {
  const CupCard({super.key, required this.cup});

  final Cup cup;

  @override
  Widget build(BuildContext context) {
    //Column with image and size label
    return SizedBox(
      width: 400,
      height: 500,
      child: Column(
        children: [
          Expanded(
            child: cup.image != null
                ? Image.file(
                    width: 400,
                    height: 400,
                    File(cup.image!.path),
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image_not_supported),
          ),
          Text(
            cup.size.toString().split('.').last,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
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
