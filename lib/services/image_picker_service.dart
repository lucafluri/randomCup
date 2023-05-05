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
