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

  Future readText() async{
    FirebaseVisionImage image = FirebaseVisionImage.fromFile(file);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

    VisionText readText = await textRecognizer.processImage(image);

    for(TextBlock block in readText.blocks){
      for(TextLine line in block.lines){
        for(TextElement element in line.elements){
          print(element.text);
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: file==null
      ? Center(child: Text('No data available'),) : enableUpload(),
      // : isImageLoaded ?
      // Container(
      //   height: 100.0,
      //   width: double.maxFinite,
      //   child:Card(
      //   child: Row(
      //     children: <Widget>[
      //       Image.file(file) , 
      //       SizedBox(width: 20.0,),
      //       Text(description)
      //     ],
      //   ),
      // )): enableUpload(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage();
        },
        elevation: 10.0,
        backgroundColor: Colors.black,
        child: Icon(Icons.camera),
      ),
    );
  }

   Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(file, height: 300.0, width: 300.0),
          // TextFormField(
          //   decoration: new InputDecoration(
          //     hintText: 'Crop Name'
          //   ),
          // ),
          RaisedButton(
            elevation: 7.0,
            child: Row(
              children: <Widget>[
                new Icon(Icons.keyboard_arrow_right),
                new Text(
                  'Upload',
                  style: new TextStyle(color: Colors.white),
                ),
              ],
            ),
            color: Colors.blue,
            onPressed: () {
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

              readText();
            },
          )
        ],
      ),
    );
  }
}
