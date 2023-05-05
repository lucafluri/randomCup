import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/cup.dart';
import '../../../services/image_picker_service.dart';
import '../../capture/capture.dart';

class FloatingAdd extends StatelessWidget {
  FloatingAdd({
    super.key,
  });

  // final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton(
            heroTag: "pickImage",
            onPressed: () async {
              final nav = Navigator.of(context);
              XFile? image = await pickImage();
              if (image != null) {
                Cup cup = Cup();
                cup.image = await imageToBase64(image);
                nav.pushNamed('/add', arguments: cup);
              }
            },
            tooltip: "Add from Media",
            child: const Icon(Icons.image),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton(
            heroTag: "captureImage",
            onPressed: () async {
              final nav = Navigator.of(context);
              XFile? image = await captureImage();
              if (image != null) {
                Cup cup = Cup();
                cup.image = await imageToBase64(image);
                nav.pushNamed('/add', arguments: cup);
              }
            },
            tooltip: "Add from Camera",
            child: const Icon(Icons.camera),
          ),
        ),
      ],
    );
  }
}
