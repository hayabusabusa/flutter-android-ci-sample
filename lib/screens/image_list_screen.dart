import 'package:flutter/material.dart';

import 'package:sample/screens/screens.dart';

class ImageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView(
        children: [
          _ImageListItem(
            imageURL: 'https://images.unsplash.com/photo-1616530277010-4c328803766f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80', 
            title: 'Sunset', 
            description: 'this is nice sunset.'
          ),
          _ImageListItem(
            imageURL: 'https://images.unsplash.com/photo-1616534696797-faf4812c9172?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80', 
            title: 'Guitar', 
            description: 'Maybe fender stratcaster.'
          ),
        ],
      ),
    );
  }
}

class _ImageListItem extends StatelessWidget {
  final String imageURL;
  final String title;
  final String description;

  _ImageListItem({
    required this.imageURL,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ImageListViewerScreen(imageURL: imageURL),
            fullscreenDialog: true,
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // NOTE: Image
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration( 
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            // NOTE: Spacer
            SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // NOTE: Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  // NOTE: Spacer
                  SizedBox(height: 4,),
                  // NOTE: Description
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}