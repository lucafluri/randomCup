import 'package:flutter/material.dart';

class FloatingAddWidget extends StatelessWidget {
  const FloatingAddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              // captureImage();
            },
            tooltip: "Add from Camera",
            child: const Icon(Icons.image),
          ),
          FloatingActionButton(
            onPressed: () {
              // captureImage();
            },
            tooltip: "Add from Gallery",
            child: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}
