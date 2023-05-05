import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/cup.dart';
import '../../services/cup_handler.dart';

class CaptureScreen extends StatefulWidget {
  CaptureScreen({super.key});

  static const routeName = '/add';

  // Controller controller = Controller();

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  double _currentSliderValue = 2;
  Uint8List? image;

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
    return _CaptureScreenView(this);
  }
}

class _CaptureScreenView extends StatelessWidget {
  const _CaptureScreenView(this.state, {Key? key}) : super(key: key);
  final _CaptureScreenState state;

  @override
  Widget build(BuildContext context) {
    final cup = ModalRoute.of(context)!.settings.arguments as Cup;
    if (state.image == null) {
      state.image = base64Decode(cup.image!);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new cup"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.memory(
              state.image!,
              fit: BoxFit.cover,
            ),
            // Image.memory(),
            Slider(
              value: state._currentSliderValue,
              min: 1,
              max: 3,
              divisions: 2,
              label: state.getLabel(),
              onChanged: (double value) {
                state.setState(() {
                  state._currentSliderValue = value;
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              onPressed: () {
                cup.size = state.getSize();
                addCup(cup);
                Navigator.pop(context, state._currentSliderValue.toInt());
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
