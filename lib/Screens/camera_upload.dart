import 'package:flutter/material.dart';

class CameraUpload extends StatefulWidget {
  @override
  _CameraUploadState createState() => _CameraUploadState();
}

class _CameraUploadState extends State<CameraUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        elevation: 10.0,
        child: Icon(Icons.camera),
      ),
    );
  }
}