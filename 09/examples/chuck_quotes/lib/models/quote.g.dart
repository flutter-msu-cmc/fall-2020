// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quote _$_$_QuoteFromJson(Map<String, dynamic> json) {
  return _$_Quote(
    categories: (json['categories'] as List)?.map((e) => e as String)?.toList(),
    createdAt: json['created_at'] as String,
    iconUrl: json['icon_url'] as String,
    id: json['id'] as String,
    updatedAt: json['updated_at'] as String,
    url: json['url'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$_$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      'categories': instance.categories,
      'created_at': instance.createdAt,
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
      'value': instance.value,
    };
