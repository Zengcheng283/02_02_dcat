import 'dart:io';
import 'package:dcat/dcat.dart' as dcat;
import 'package:process_run/shell.dart';


Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
  print_out("touch \tpath \t'create file'");
  print_out("rm \tpath \t'remove file'");
  print_out("trash \tpath \t'remove file to trash'");
  print_out("print \ttext \t'print out words'");
  }
  else if (arguments[0] == "trash") {
    if (await FileSystemEntity.isDirectory(arguments[1])) {
  print_out('error: ${arguments[1]} is a directory');
}
  else {
    File file = File(arguments[1]);
    if(await file.exists()) {
      Directory dir = new Directory("/workspace/trash/");
      dir.create();
      file.copy("/workspace/personal_dcat/trash/${arguments[1]}");
      file.delete();
      }
  }
  }
  else if (arguments[0] == "print") {
    if (arguments[1].isEmpty) {
      print_out("no input text");
    }
    else {
      List list = arguments.toList();
      list.removeRange(0, 1);
    String s = list.join(" ");
    print_out(s);
    }
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
    else {
      File new_file = new File(arguments[1]);
      IOSink isk = new_file.openWrite();
      isk.close();
    }
  }
}

void print_out(var text) {
  stdout.writeln('$text');
}