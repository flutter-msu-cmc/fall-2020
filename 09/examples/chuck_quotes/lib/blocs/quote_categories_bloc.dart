import 'dart:async';

import 'package:location/location.dart';

import '../api/response.dart';
import '../models/quote_category.dart';
import '../repositories/categories_repository.dart';

class QuoteCategoriesBloc {
  CategoriesRepository _repository;
  StreamController _controller;

  StreamSink<Response<QuoteCategories>> get listSink => _controller.sink;

  Stream<Response<QuoteCategories>> get listStream => _controller.stream;

  QuoteCategoriesBloc() {
    _controller = StreamController<Response<QuoteCategories>>();
    _repository = CategoriesRepository();
    getCategories();
    _getLocation();
  }

  getCategories() async {
    listSink.add(Response.loading('Loading categories'));
    try {
      final categories = await _repository.getCategoriesList();
      listSink.add(Response.completed(categories));
    } catch (e) {
      listSink.add(Response.error(e.toString()));
    }
  }

  dispose() {
    _controller?.close();
  }

  void _getLocation() async {
    final location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();
    print('_locationData: $_locationData');
  }
}
