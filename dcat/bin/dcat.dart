import 'dart:io';
import 'package:dcat/dcat.dart' as dcat;
import 'package:process_run/shell.dart';


Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
  print_out("dcat \ttouch \tpath \t'create file'");
  print_out("dcat \trm \tpath \t'remove file'");
  print_out("dcat \ttext \t\t'print out words'");
  }
  else if (arguments[0] == "print") {
    print_out(arguments[1]);
  }
  else if(arguments[0] == "rm") {
    if (await FileSystemEntity.isDirectory(arguments[1])) {
  print_out('error: ${arguments[1]} is a directory');
}
  else {
  FileSystemEntity file = File(arguments[1]);
  file.delete();
  }
}
else if(arguments[0] == "touch") {
    FileSystemEntity file = File(arguments[1]);
    if (await file.exists()) {
      print_out("File exists");
    }
    else if(!arguments[1].contains(".")) {
      print_out("This is dir, not file path!");
    }
    else {
      File new_file = new File(arguments[1]);
      IOSink isk = new_file.openWrite();
      isk.close();
    }
  }
  else {
    print_out(arguments[0]);
  }
}

void print_out(var text) {
  stdout.writeln('$text');
}