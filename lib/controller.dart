import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Classes/cup.dart';

// Singleton Controller
class Controller {
  static final Controller _controller = Controller._internal();
  factory Controller() => _controller;
  Controller._internal();

  ValueNotifier<List<Cup>> cups = ValueNotifier([]);

  Future<XFile?> captureImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print(image?.path);

    return image;
  }

  Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    print(image?.path);
    return image;
  }

  void addCup(XFile image, Sizes size) {
    final Cup cup = Cup();
    cup.image = image;
    cup.size = size;
    cups.value = List.from(cups.value)..add(cup);
    // cups.add(cup);
  }

  // void removeCup(int index) {
  //   cups.removeAt(index);
  // }

  // void updateCup(int index, Sizes size) {
  //   cups[index].size = size;
  // }
}
