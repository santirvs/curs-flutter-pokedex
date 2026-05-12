// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchProduct _$SearchProductFromJson(Map<String, dynamic> json) =>
    _SearchProduct(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchProductToJson(_SearchProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
    };

_SearchProductsResult _$SearchProductsResultFromJson(
  Map<String, dynamic> json,
) => _SearchProductsResult(
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => SearchProduct.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SearchProduct>[],
);

Map<String, dynamic> _$SearchProductsResultToJson(
  _SearchProductsResult instance,
) => <String, dynamic>{'products': instance.products};
