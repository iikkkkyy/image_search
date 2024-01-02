import 'package:image_search_fast_coding/data/dto/image_dto.dart';
import 'package:image_search_fast_coding/data/model/image_model.dart';

extension DtoToModel on PixabayImage {
  ImageModel toImageItem() {
    return ImageModel(
        imageURL: previewURL ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs5Xs8ukkBwO2KxnpayyUoQCE6JZTDIfV93FuzVqAqQQ&s',
        tags: tags ?? '');
  }
}
