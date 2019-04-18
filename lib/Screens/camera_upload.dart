import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CameraUpload extends StatefulWidget {
  @override
  _CameraUploadState createState() => _CameraUploadState();
}

class _CameraUploadState extends State<CameraUpload> {
  File file;
  String description = '';
  bool isImageLoaded = false;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      file = image;
      isImageLoaded = true;
    });
  }

  Future<String> readText() async {
    FirebaseVisionImage image = FirebaseVisionImage.fromFile(file);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

    VisionText readText = await textRecognizer.processImage(image);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          String finalText = (element.text);
          print(finalText);
          // Text(finalText);
          description = finalText;
        }
      }
    }
    return description;
  }

  bool isAnalyzed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: file == null
          ? Center(child: Text('No data available'))
          : enableUpload(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        elevation: 10.0,
        backgroundColor: Colors.black,
        child: Icon(Icons.camera),
      ),
    );
  }

  Widget enableUpload() {
    // String text = '';

    // text.asStream();
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(file, height: 300.0, width: 300.0),
          RaisedButton(
              elevation: 7.0,
              child: Row(
                children: <Widget>[
                  new Icon(Icons.keyboard_arrow_right),
                  new Text(
                    'Analyze Text',
                    style:
                        new TextStyle(color: Colors.white, letterSpacing: 2.0),
                  ),
                ],
              ),
              color: Colors.blue,
              onPressed: () {
                // isAnalyzed = true;
                // var path = uuid.v1();
                // var positionData = position.toString();
                // var url =
                //     "https://floating-oasis-94041.herokuapp.com/image?lat=100&lon=90&name=hahah&photoUrl";
                // var client = http.Client();
                // client.post(url, body: {"name": "doodle"}).then((response) {
                //   print("Response status: ${response.statusCode}");
                //   print("Response body: ${response.body}");
                //   // print("$positionData");
                // });
                // final StorageReference firebaseStorageRef =
                //     FirebaseStorage.instance.ref().child('file.jpg');
                // final StorageUploadTask task = firebaseStorageRef.putFile(file);
                // Navigator.popAndPushNamed(context, '/camera_upload');

                readText().then((value) {
                  setState(() {
                    isAnalyzed = true;
                    value = description;
                  });
                });
              }),
          SizedBox(
            height: 20.0,
          ),
          isAnalyzed
              ? Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.red[200],
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black, width: 2.0),
                  //   borderRadius: BorderRadius.circular(15.0),
                  // ),
                  child: Center(
                    child: Text(
                      description,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                )
              : Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.blue[200],
                )
        ],
      ),
    );
  }
}
