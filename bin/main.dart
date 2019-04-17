import 'dart:io';

import 'package:image_res/image_res.dart';

/// A main entrypoint of a CLI tool
void main(List<String> args) {
  const configPath = 'image_res.yaml';
  if (FileSystemEntity.typeSync(configPath) == FileSystemEntityType.notFound) {
    // `image_res.yaml` does not exist
    print(
        'There is no `image_res.yaml` in your project\'s root directory. Please consult https://github.com/pirsquareff/img_res for more information regarding the configuration.');
    exit(2);
  }

  var org = FlutterImgResolutionOrganizer(configPath);
  int exitCode = org.run();

  exit(exitCode);
}