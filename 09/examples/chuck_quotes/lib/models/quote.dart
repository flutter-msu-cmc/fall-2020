import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
abstract class Quote with _$Quote {
  const factory Quote({
    @JsonKey(name: 'categories') List<String> categories,
    @JsonKey(name: 'created_at') final String createdAt,
    @JsonKey(name: 'icon_url') final String iconUrl,
    @JsonKey(name: 'id') final String id,
    @JsonKey(name: 'updated_at') final String updatedAt,
    @JsonKey(name: 'url') final String url,
    @JsonKey(name: 'value') final String value,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
