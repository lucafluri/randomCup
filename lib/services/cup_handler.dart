import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
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
  return indexes[Random().nextInt(indexes.length)];
}

void addCup(XFile image, Sizes size) {
  final Cup cup = Cup();
  cup.image = image;
  cup.size = size;
  cups.value = List.from(cups.value)..add(cup);
  // cups.add(cup);
}
