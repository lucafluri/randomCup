import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../models/cup.dart';
import 'cup_handler.dart';

Directory? localDir;
Directory? imageDir;

String cupsFileName = "cups.json";

void initStorageService() async {
  localDir = await _localPath;
  imageDir = Directory('${localDir!.path}/images');
  if (!imageDir!.existsSync()) {
    imageDir!.createSync();
  }
}

Future<Directory> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory;
}

void printFiles(String ending) async {
  Directory dir = await _localPath;
  final List<FileSystemEntity> files =
      dir.listSync(recursive: true, followLinks: false);
  final List<String> txtFiles = files
      .where((file) => file.path.endsWith(ending) && file is File)
      .map((file) => file.path)
      .toList();
  print(txtFiles);
}

Future<File> getlocalFile(String filename) async {
  final dir = await _localPath;
  final path = dir.path;
  return File('$path/$filename');
}

// Get file at path
File getFile(String path) {
  return File(path);
}

Future<File> writeData(String data) async {
  final file = await getlocalFile(cupsFileName);

  // Write the file
  return file.writeAsString(data);
}

Future<String> readData() async {
  try {
    final file = await getlocalFile(cupsFileName);

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    return "";
  }
}

// Read file as String
Future<String> readFile(File file) async {
  return await file.readAsString();
}

// Check if file exists
Future<bool> fileExists(String filename) async {
  final file = await getlocalFile(filename);
  return file.existsSync();
}

String cupsToJSON() {
  final String jsonString =
      jsonEncode(cups.value.map((obj) => obj.toJson()).toList());
  return jsonString;
}

List<Cup> jsonToCups(String jsonString) {
  final List<dynamic> json = jsonDecode(jsonString);
  final List<Cup> cups = json.map((obj) => Cup.fromJson(obj)).toList();
  return cups;
}

// Get local json file as XFile
Future<XFile> getLocalJSON() async {
  final File file = await getlocalFile(cupsFileName);
  return XFile(file.path);
}

// Share json file
void shareJSON() async {
  await Share.shareXFiles([await getLocalJSON()]);
}

// Pick file from Storage
// Return path
Future<String> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: ['json'],
  );

  if (result != null) {
    PlatformFile file = result.files.first;
    return file.path!;
  } else {
    // User canceled the picker
    return "";
  }
}

// Read picked file as JSON and save
void restoreCupsFromFile() async {
  final filePath = await pickFile();
  if (filePath == "") return;
  cups.value = jsonToCups(await readFile(getFile(filePath)));
}
