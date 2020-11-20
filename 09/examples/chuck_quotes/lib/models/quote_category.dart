class QuoteCategories {
  final List<QuoteCategory> categories;

  int get length => categories != null ? categories.length : 0;

  const QuoteCategories(this.categories);

  factory QuoteCategories.from(List<dynamic> json) =>
      QuoteCategories(json != null && json.length > 0
          ? json.map((e) => QuoteCategory(e))?.toList()
          : null);

  List<dynamic> toJson() {
    final data = [];
    if (categories != null) {
      data.addAll(categories.map((e) => e.text));
    }
    return data;
  }
}

class QuoteCategory {
  final String text;

  const QuoteCategory(this.text);
}
