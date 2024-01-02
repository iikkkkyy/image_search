import 'dart:async';

import 'package:image_search_fast_coding/data/model/image_model.dart';
import 'package:image_search_fast_coding/data/repository/image_repository.dart';

class MainViewModel {

  // Todo Provider 변경
  final _repository = ImageRepository();

  List<ImageModel> _items = [];

  final _isLoading = StreamController<bool>();

  Future<void> searchImage(String query) async {
    _isLoading.add(true);

    _items = await _repository.getImageItems(query);

    _isLoading.add(false);

  }

}