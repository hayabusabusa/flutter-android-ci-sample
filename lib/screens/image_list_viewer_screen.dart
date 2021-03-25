import 'package:flutter/material.dart';

class ImageListViewerScreen extends StatelessWidget {
  final String imageURL;

  ImageListViewerScreen({
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // NOTE: Viewer
          InteractiveViewer(
            child: Center(
              child: Image.network(imageURL),
            ),
          ),
          // NOTE: Close Button
          Positioned(
            left: 20,
            top: 32,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ), 
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
          ),
        ]
      ),
    );
  }
}