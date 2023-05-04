import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Screens/capture.dart';
import '../controller.dart';

class FloatingAdd extends StatelessWidget {
  FloatingAdd({
    super.key,
  });

  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton(
            heroTag: "pickImage",
            onPressed: () {
              controller.pickImage();
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
              XFile? image = await controller.captureImage();
              if (image != null) {
                nav.push(MaterialPageRoute(
                    builder: (context) => CaptureScreen(image: image)));
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
