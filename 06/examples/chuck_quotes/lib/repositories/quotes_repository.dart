import '../api/api.dart';
import '../models/quote.dart';
import '../models/quote_category.dart';

class CategoriesRepository {
  ApiProvider _provider = ApiProvider();

  Future<Quote> getQuote(QuoteCategory category) async {
    final json = await _provider.get('jokes/random?category=${category.text}');
    return Quote.from(json);
  }
}
