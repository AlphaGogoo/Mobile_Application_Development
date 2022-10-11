// sudo cp /workspace/Mobile_Application_Development/rm/bin/rm.exe /usr/bin/rm
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
      try {
        var time = new DateTime.now().millisecondsSinceEpoch;
        var fileName = path.split("/").last;
        if(putInBin){
          await file.rename('/workspace/Mobile_Application_Development/recycleBin/${time}_${fileName}');   
        }else{
          await file.delete();
        }
      }catch(e){
        _handleError(path);
      }
    }
  }
}

Future<void> _handleError(String path) async {
  if (await File(path).exists()) {
    ;
  } else {
    stderr.writeln('error: no such file: $path ');
  }
}
