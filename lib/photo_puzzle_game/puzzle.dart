import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imgs;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: photo(),
  ));
}

class photo extends StatefulWidget {
  const photo({super.key});

  @override
  State<photo> createState() => _photoState();
}

class _photoState extends State<photo> {
  List<imgs.Image> mylist = [];
  List list1 = [];
  List temp = List.filled(9, true);
  bool t = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // list1.addAll(mylist);
    getImageFileFromAssets("myassets/hints_present.png").then((value) {
      final image = imgs.decodeJpg(value.readAsBytesSync());
      mylist = splitImage(image!, 3, 3);
      mylist.shuffle();
      t = true;
      setState(() {});
    });

    // // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    // final thumbnail = img.copyResize(image!, width: 120);
    // // Save the thumbnail to a jpeg file.
    // encodeToJpgFile('out/thumbnail-test.png', thumbnail);
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  List<imgs.Image> splitImage(
      imgs.Image inputImage, int horizontalPieceCount, int verticalPieceCount) {
    imgs.Image image = inputImage;

    final pieceWidth = (image.width / horizontalPieceCount).round();
    final pieceHeight = (image.height / verticalPieceCount).round();
    final pieceList = List<imgs.Image>.empty(growable: true);

    var x = 0, y = 0;
    for (int i = 0; i < horizontalPieceCount; i++) {
      for (int j = 0; j < verticalPieceCount; j++) {
        pieceList.add(imgs.copyCrop(image,
            x: x, y: y, width: pieceWidth, height: pieceHeight));
        x = x + pieceWidth;
      }
      x = 0;
      y = y + pieceHeight;
    }
    return pieceList;
  }

  @override
  Widget build(BuildContext context) {
    double tot_width = MediaQuery.of(context).size.width;
    double con_width = (tot_width - 20) / 3;

    return Scaffold(
        appBar: AppBar(
          title: Text("PHOTO PUZZLES"),
        ),
        body: (t==true)?GridView.builder(
          itemCount: mylist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            Uint8List testImg = imgs.encodeJpg(mylist[index]);
            return (temp[index])
                ? Draggable(
                onDraggableCanceled: (velocity, offset) {
                  temp = List.filled(9, true);
                  setState(() {});
                },
                data: index,
                onDragStarted: () {
                  temp = List.filled(9, false);
                  setState(() {});
                },
                child: Container(
                  height: con_width,
                  width: con_width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(testImg), fit: BoxFit.fill)),
                ),
                feedback: Container(
                  height: con_width,
                  width: con_width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(testImg), fit: BoxFit.fill)),
                ))
                : DragTarget(
              onAccept: (data) {
                temp = List.filled(9, true);
                var c = mylist[data as int]; // as like c=a
                mylist[data as int] = mylist[index]; //a=b
                mylist[index] = c;
                //
                // if((listEquals(testImg, list1)))
                //   {
                //     print("you are win...!");
                // }
                setState(() {});
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: con_width,
                  width: con_width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(testImg), fit: BoxFit.fill)),
                );
              },
            );
          },
        ):CircularProgressIndicator());
  }
}
