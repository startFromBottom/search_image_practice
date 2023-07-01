import 'package:flutter/material.dart';
import 'package:search_image_app/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  const PhotoWidget({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            photo.previewURL,
          ),
        ),
      ),
    );
  }
}
