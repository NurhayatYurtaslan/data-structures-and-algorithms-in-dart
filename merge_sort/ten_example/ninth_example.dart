import 'dart:io';

void mergeFiles(String file1, String file2, String outputFile) async {
  var output = File(outputFile).openWrite();
  var file1Stream = File(file1).openRead().transform(SystemEncoding().decoder);
  var file2Stream = File(file2).openRead().transform(SystemEncoding().decoder);

  var file1Lines = file1Stream.toList();
  var file2Lines = file2Stream.toList();

  await for (var line1 in file1Lines) {
    await for (var line2 in file2Lines) {
      if (line1.compareTo(line2) < 0) {
        output.writeln(line1);
      } else {
        output.writeln(line2);
      }
    }
  }
  await output.flush();
  await output.close();
}

void externalMergeSort(List<String> files) async {
  if (files.length == 1) return;

  List<String> tempFiles = [];
  for (int i = 0; i < files.length; i += 2) {
    String tempFile = 'sorted_temp_${i ~/ 2}.txt';
    await mergeFiles(files[i], files[i + 1], tempFile);
    tempFiles.add(tempFile);
  }

  externalMergeSort(tempFiles);
}

void main() async {
  List<String> files = ['part1.txt', 'part2.txt', 'part3.txt', 'part4.txt'];

  // Her dosya ayrı ayrı sıralandıktan sonra, external merge sort yapılır
  externalMergeSort(files);
}
