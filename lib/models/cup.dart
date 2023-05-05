import 'package:image_picker/image_picker.dart';

enum Sizes { small, medium, large, all }

class Cup {
  // String pathToImage = "";
  XFile? image;
  Sizes size = Sizes.medium;
}
