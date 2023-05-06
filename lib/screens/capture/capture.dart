import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/size_togglebutton.dart';
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

  // final List<Widget> toggleButtons = [
  //   Icon(Icons.coffee, size: 20),
  //   Icon(Icons.coffee, size: 30),
  //   Icon(Icons.coffee, size: 40),
  // ];

  final List<bool> isSelected = [false, true, false];

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
        title: const Text("Add new Mug"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.memory(
                height: 400,
                state.image!,
                fit: BoxFit.cover,
              ),
            ),
            // Image.memory(),
            // Slider(
            //   value: state._currentSliderValue,
            //   min: 1,
            //   max: 3,
            //   divisions: 2,
            //   // label: state.getLabel(),
            //   onChanged: (double value) {
            //     state.setState(() {
            //       state._currentSliderValue = value;
            //     });
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ToggleButtons(
                direction: Axis.horizontal,
                isSelected: state.isSelected,
                constraints: const BoxConstraints(
                  minHeight: 60.0,
                  minWidth: 100.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                onPressed: (int idx) {
                  state.setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < state.isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == idx) {
                        state.isSelected[buttonIndex] = true;
                      } else {
                        state.isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                children: toggleButtons,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: 24.0, top: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                onPressed: () {
                  final indexTrue = state.isSelected.indexOf(true);
                  cup.size = getSizeFromInt(indexTrue);
                  addCup(cup);
                  Navigator.pop(context, state._currentSliderValue.toInt());
                },
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
