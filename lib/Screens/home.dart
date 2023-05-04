import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:randomcup/Widgets/floating_add.dart';

Future<void> captureImage() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image.
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
  // await picker.pickImage(source: ImageSource.camera);
}

Future<void> pickImage() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image.
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  // await picker.pickImage(source: ImageSource.camera);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Random Cup"),
        ),
        body: const Center(
          child: Text("Hello World"),
        ),
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  pickImage();
                },
                tooltip: "Add from Camera",
                child: const Icon(Icons.image),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  captureImage();
                },
                tooltip: "Add from Camera",
                child: const Icon(Icons.camera),
              ),
            ),
          ],
        ));
  }
}
