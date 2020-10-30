import 'dart:async';

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
}
