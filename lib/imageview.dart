import 'package:flutter/material.dart';

class imageview extends StatefulWidget {
  String url;
  imageview({
    required this.url,
  });
  @override
  State<imageview> createState() => _imageviewState(
        url: url,
      );
}

class _imageviewState extends State<imageview> {
  String url;
  _imageviewState({
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
