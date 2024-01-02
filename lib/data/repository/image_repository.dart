import 'package:image_search_fast_coding/data/data_source/image_api.dart';
import 'package:image_search_fast_coding/data/mapper/image_mapper.dart';
import 'package:image_search_fast_coding/data/model/image_model.dart';

class ImageRepository {
  //Todo provider 변경
  final _api = ImageApi();

  Future<List<ImageModel>> getImageItems(String query) async {

    final dto = await _api.getImages(query);
    if(dto.hits == null){
      return [];
    }

    return dto.hits!.map((e) => e.toImageItem()).toList();

  }
}