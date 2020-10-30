import 'quote_category.dart';

class Quote {
  final QuoteCategories categories;
  final String createdAt;
  final String iconUrl;
  final String id;
  final String updatedAt;
  final String url;
  final String value;

  const Quote(
      {this.categories,
      this.createdAt,
      this.iconUrl,
      this.id,
      this.updatedAt,
      this.url,
      this.value});

  factory Quote.from(Map<String, dynamic> json) => Quote(
        categories: json['categories'] != null
            ? QuoteCategories.from(json['categories'])
            : null,
        createdAt: json['created_at'],
        iconUrl: json['icon_url'],
        id: json['id'],
        updatedAt: json['updated_at'],
        url: json['url'],
        value: json['value'],
      );
}
