import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../controller.dart';
import '../Classes/cup.dart';

class CaptureScreen extends StatefulWidget {
  CaptureScreen({super.key, required this.image});

  final XFile image;
  Controller controller = Controller();

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  double _currentSliderValue = 2;

  String getLabel() {
    switch (_currentSliderValue.toInt()) {
      case 1:
        return "small";
      case 2:
        return "medium";
      case 3:
        return "large";
      default:
        return "medium";
    }
  }

  Sizes getSize() {
    switch (_currentSliderValue.toInt()) {
      case 1:
        return Sizes.small;
      case 2:
        return Sizes.medium;
      case 3:
        return Sizes.large;
      default:
        return Sizes.medium;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Capture"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              File(widget.image.path),
              fit: BoxFit.cover,
            ),
            Slider(
              value: _currentSliderValue,
              min: 1,
              max: 3,
              divisions: 2,
              label: getLabel(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              onPressed: () {
                widget.controller.addCup(widget.image, getSize());
                Navigator.pop(context, _currentSliderValue.toInt());
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
