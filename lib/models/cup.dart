import 'package:image_picker/image_picker.dart';

enum Sizes { small, medium, large, all }

class Cup {
  Cup({this.image, this.size = Sizes.medium});
  // String pathToImage = "";
  // XFile? image;
  String? image;
  Sizes size = Sizes.medium;

  //Cup to JSON
  // TODO BROKEN
  Map<String, dynamic> toJson() => {
        'image': image,
        'size': size.toString(),
      };

  // Cup from JSON
  static Cup fromJson(Map<String, dynamic> json) {
    return Cup(
      image: json['image'],
      size: Sizes.values.firstWhere((e) => e.toString() == json['size']),
    );
  }
}
