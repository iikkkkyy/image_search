import 'package:flutter/cupertino.dart';
import 'package:image_search_fast_coding/data/model/image_model.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageModel imageItem;

  const ImageItemWidget({super.key, required this.imageItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageItem.imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
