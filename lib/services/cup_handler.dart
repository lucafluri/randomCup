import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:randomcup/services/image_picker_service.dart';
import 'package:randomcup/services/storage_service.dart';
import '../models/cup.dart';

ValueNotifier<List<Cup>> cups = ValueNotifier([]);

Cup getRandomCup() {
  if (cups.value.isEmpty) {
    return Cup();
  }
  return cups.value[Random().nextInt(cups.value.length)];
}

Cup getRandomCupWithSize(Sizes size) {
  final List<Cup> indexes = [];
  for (int i = 0; i < cups.value.length; i++) {
    if (cups.value[i].size == size || size == Sizes.all) {
      indexes.add(cups.value[i]);
    }
  }
  if (indexes.isEmpty) return Cup();
  return indexes[Random().nextInt(indexes.length)];
}

Cup getRandomCupWithSizes(List<Sizes> sizes) {
  final List<Cup> indexes = [];
  for (int i = 0; i < cups.value.length; i++) {
    if (sizes.contains(cups.value[i].size)) {
      indexes.add(cups.value[i]);
    }
  }
  if (indexes.isEmpty) return Cup();
  return indexes[Random().nextInt(indexes.length)];
}

Sizes getSizeFromInt(int i) {
  switch (i) {
    case 0:
      return Sizes.small;
    case 1:
      return Sizes.medium;
    case 2:
      return Sizes.large;
    default:
      return Sizes.medium;
  }
}

// void addCup(String image, Sizes size) {
//   final Cup cup = Cup();
//   // cup.image = image;
//   // cup.image_64 = imageToBase64(image);
//   cup.size = size;
//   cups.value = List.from(cups.value)..add(cup);
// }

void addCup(Cup cup) {
  cups.value = List.from(cups.value)..add(cup);
  writeData(cupsToJSON());
}

void removeCup(Cup cup) {
  cups.value = List.from(cups.value)..remove(cup);
  writeData(cupsToJSON());
}

void restoreCups() async {
  cups.value = List.from(jsonToCups(await readData()));
}
