import '../api/api.dart';
import '../models/quote_category.dart';

class CategoriesRepository {
  ApiProvider _provider = ApiProvider();

  Future<QuoteCategories> getCategoriesList() async {
    final response = await _provider.get('jokes/categories');
    final categories = QuoteCategories.from(response.data);
    return categories;
  }
}
