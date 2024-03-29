import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_fast_coding/data/model/image_model.dart';
import 'package:image_search_fast_coding/data/repository/image_repository.dart';

class MainViewModel extends ChangeNotifier {

  final _repository = ImageRepository();

  List<ImageModel> _items = [];
  final _isLoading = StreamController<bool>();

  List<ImageModel> get items => List.unmodifiable(_items);
  get isLoading => _isLoading.stream;

  Future<void> searchImage(String query) async {
    _isLoading.add(true);
    notifyListeners();

    _items = await _repository.getImageItems(query);

    notifyListeners();
    _isLoading.add(false);

  }

}