import 'dart:convert';

import 'package:image_picker/image_picker.dart';

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

//Image to base64
Future<String> imageToBase64(XFile image) async {
  final bytes = await image.readAsBytes();
  final String base64 = base64Encode(bytes);
  return base64;
}

//Base64 to image
Future<XFile> base64ToImage(String base64) async {
  final bytes = base64Decode(base64);
  final XFile image = XFile.fromData(bytes);
  return image;
}
