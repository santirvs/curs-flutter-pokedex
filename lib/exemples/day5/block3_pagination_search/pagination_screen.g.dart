// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationProduct _$PaginationProductFromJson(Map<String, dynamic> json) =>
    _PaginationProduct(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationProductToJson(_PaginationProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'stock': instance.stock,
    };

_PaginationProductsPage _$PaginationProductsPageFromJson(
  Map<String, dynamic> json,
) => _PaginationProductsPage(
  products: (json['products'] as List<dynamic>)
      .map((e) => PaginationProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$PaginationProductsPageToJson(
  _PaginationProductsPage instance,
) => <String, dynamic>{'products': instance.products, 'total': instance.total};
