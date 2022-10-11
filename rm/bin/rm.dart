
import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()..addFlag('recycle', negatable: false, abbr: 'r');
  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;
  rm(paths, putInBin: argResults['recycle'] as bool);
}

Future<void> rm(List<String> paths, {bool putInBin = false}) async {
  if (paths.isEmpty) {
    await stdin.pipe(stdout);
  } else {
    for (final path in paths) {
      File file = new File(path);
      if(await file.exists()){
        var time = new DateTime.now().millisecondsSinceEpoch;
        var fileName = path.split("/").last;
        if(putInBin){
          await file.rename('/workspace/Mobile_Application_Development/recycleBin/${fileName}');   
        }else{
          await file.delete();
        }
      }else{
      } 
    }
  }
}
