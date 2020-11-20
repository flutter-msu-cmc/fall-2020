// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
class _$QuoteTearOff {
  const _$QuoteTearOff();

// ignore: unused_element
  _Quote call(
      {@JsonKey(name: 'categories') List<String> categories,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'icon_url') String iconUrl,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'value') String value}) {
    return _Quote(
      categories: categories,
      createdAt: createdAt,
      iconUrl: iconUrl,
      id: id,
      updatedAt: updatedAt,
      url: url,
      value: value,
    );
  }

// ignore: unused_element
  Quote fromJson(Map<String, Object> json) {
    return Quote.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Quote = _$QuoteTearOff();

/// @nodoc
mixin _$Quote {
  @JsonKey(name: 'categories')
  List<String> get categories;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'icon_url')
  String get iconUrl;
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'url')
  String get url;
  @JsonKey(name: 'value')
  String get value;

  Map<String, dynamic> toJson();
  $QuoteCopyWith<Quote> get copyWith;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'categories') List<String> categories,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'icon_url') String iconUrl,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'value') String value});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res> implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  final Quote _value;
  // ignore: unused_field
  final $Res Function(Quote) _then;

  @override
  $Res call({
    Object categories = freezed,
    Object createdAt = freezed,
    Object iconUrl = freezed,
    Object id = freezed,
    Object updatedAt = freezed,
    Object url = freezed,
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories as List<String>,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      id: id == freezed ? _value.id : id as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      url: url == freezed ? _value.url : url as String,
      value: value == freezed ? _value.value : value as String,
    ));
  }
}

/// @nodoc
abstract class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) then) =
      __$QuoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'categories') List<String> categories,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'icon_url') String iconUrl,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'value') String value});
}

/// @nodoc
class __$QuoteCopyWithImpl<$Res> extends _$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(_Quote _value, $Res Function(_Quote) _then)
      : super(_value, (v) => _then(v as _Quote));

  @override
  _Quote get _value => super._value as _Quote;

  @override
  $Res call({
    Object categories = freezed,
    Object createdAt = freezed,
    Object iconUrl = freezed,
    Object id = freezed,
    Object updatedAt = freezed,
    Object url = freezed,
    Object value = freezed,
  }) {
    return _then(_Quote(
      categories: categories == freezed
          ? _value.categories
          : categories as List<String>,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      id: id == freezed ? _value.id : id as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      url: url == freezed ? _value.url : url as String,
      value: value == freezed ? _value.value : value as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Quote implements _Quote {
  const _$_Quote(
      {@JsonKey(name: 'categories') this.categories,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'icon_url') this.iconUrl,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'value') this.value});

  factory _$_Quote.fromJson(Map<String, dynamic> json) =>
      _$_$_QuoteFromJson(json);

  @override
  @JsonKey(name: 'categories')
  final List<String> categories;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'value')
  final String value;

  @override
  String toString() {
    return 'Quote(categories: $categories, createdAt: $createdAt, iconUrl: $iconUrl, id: $id, updatedAt: $updatedAt, url: $url, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Quote &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality()
                    .equals(other.iconUrl, iconUrl)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(value);

  @override
  _$QuoteCopyWith<_Quote> get copyWith =>
      __$QuoteCopyWithImpl<_Quote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuoteToJson(this);
  }
}

abstract class _Quote implements Quote {
  const factory _Quote(
      {@JsonKey(name: 'categories') List<String> categories,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'icon_url') String iconUrl,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'value') String value}) = _$_Quote;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$_Quote.fromJson;

  @override
  @JsonKey(name: 'categories')
  List<String> get categories;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'icon_url')
  String get iconUrl;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'value')
  String get value;
  @override
  _$QuoteCopyWith<_Quote> get copyWith;
}
