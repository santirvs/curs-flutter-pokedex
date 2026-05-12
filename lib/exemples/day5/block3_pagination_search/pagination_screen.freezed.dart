// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationProduct {

 int get id; String get title; double get price; int get stock;
/// Create a copy of PaginationProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationProductCopyWith<PaginationProduct> get copyWith => _$PaginationProductCopyWithImpl<PaginationProduct>(this as PaginationProduct, _$identity);

  /// Serializes this PaginationProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,stock);

@override
String toString() {
  return 'PaginationProduct(id: $id, title: $title, price: $price, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $PaginationProductCopyWith<$Res>  {
  factory $PaginationProductCopyWith(PaginationProduct value, $Res Function(PaginationProduct) _then) = _$PaginationProductCopyWithImpl;
@useResult
$Res call({
 int id, String title, double price, int stock
});




}
/// @nodoc
class _$PaginationProductCopyWithImpl<$Res>
    implements $PaginationProductCopyWith<$Res> {
  _$PaginationProductCopyWithImpl(this._self, this._then);

  final PaginationProduct _self;
  final $Res Function(PaginationProduct) _then;

/// Create a copy of PaginationProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = null,Object? stock = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationProduct].
extension PaginationProductPatterns on PaginationProduct {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationProduct() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationProduct value)  $default,){
final _that = this;
switch (_that) {
case _PaginationProduct():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationProduct value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationProduct() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  double price,  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationProduct() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.stock);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  double price,  int stock)  $default,) {final _that = this;
switch (_that) {
case _PaginationProduct():
return $default(_that.id,_that.title,_that.price,_that.stock);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  double price,  int stock)?  $default,) {final _that = this;
switch (_that) {
case _PaginationProduct() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationProduct implements PaginationProduct {
  const _PaginationProduct({required this.id, required this.title, required this.price, required this.stock});
  factory _PaginationProduct.fromJson(Map<String, dynamic> json) => _$PaginationProductFromJson(json);

@override final  int id;
@override final  String title;
@override final  double price;
@override final  int stock;

/// Create a copy of PaginationProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationProductCopyWith<_PaginationProduct> get copyWith => __$PaginationProductCopyWithImpl<_PaginationProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,stock);

@override
String toString() {
  return 'PaginationProduct(id: $id, title: $title, price: $price, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$PaginationProductCopyWith<$Res> implements $PaginationProductCopyWith<$Res> {
  factory _$PaginationProductCopyWith(_PaginationProduct value, $Res Function(_PaginationProduct) _then) = __$PaginationProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, double price, int stock
});




}
/// @nodoc
class __$PaginationProductCopyWithImpl<$Res>
    implements _$PaginationProductCopyWith<$Res> {
  __$PaginationProductCopyWithImpl(this._self, this._then);

  final _PaginationProduct _self;
  final $Res Function(_PaginationProduct) _then;

/// Create a copy of PaginationProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? price = null,Object? stock = null,}) {
  return _then(_PaginationProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginationProductsPage {

 List<PaginationProduct> get products; int get total;
/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationProductsPageCopyWith<PaginationProductsPage> get copyWith => _$PaginationProductsPageCopyWithImpl<PaginationProductsPage>(this as PaginationProductsPage, _$identity);

  /// Serializes this PaginationProductsPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationProductsPage&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),total);

@override
String toString() {
  return 'PaginationProductsPage(products: $products, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginationProductsPageCopyWith<$Res>  {
  factory $PaginationProductsPageCopyWith(PaginationProductsPage value, $Res Function(PaginationProductsPage) _then) = _$PaginationProductsPageCopyWithImpl;
@useResult
$Res call({
 List<PaginationProduct> products, int total
});




}
/// @nodoc
class _$PaginationProductsPageCopyWithImpl<$Res>
    implements $PaginationProductsPageCopyWith<$Res> {
  _$PaginationProductsPageCopyWithImpl(this._self, this._then);

  final PaginationProductsPage _self;
  final $Res Function(PaginationProductsPage) _then;

/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? total = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<PaginationProduct>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationProductsPage].
extension PaginationProductsPagePatterns on PaginationProductsPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationProductsPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationProductsPage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationProductsPage value)  $default,){
final _that = this;
switch (_that) {
case _PaginationProductsPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationProductsPage value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationProductsPage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PaginationProduct> products,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationProductsPage() when $default != null:
return $default(_that.products,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PaginationProduct> products,  int total)  $default,) {final _that = this;
switch (_that) {
case _PaginationProductsPage():
return $default(_that.products,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PaginationProduct> products,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PaginationProductsPage() when $default != null:
return $default(_that.products,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationProductsPage implements PaginationProductsPage {
  const _PaginationProductsPage({required final  List<PaginationProduct> products, required this.total}): _products = products;
  factory _PaginationProductsPage.fromJson(Map<String, dynamic> json) => _$PaginationProductsPageFromJson(json);

 final  List<PaginationProduct> _products;
@override List<PaginationProduct> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  int total;

/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationProductsPageCopyWith<_PaginationProductsPage> get copyWith => __$PaginationProductsPageCopyWithImpl<_PaginationProductsPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationProductsPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationProductsPage&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),total);

@override
String toString() {
  return 'PaginationProductsPage(products: $products, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginationProductsPageCopyWith<$Res> implements $PaginationProductsPageCopyWith<$Res> {
  factory _$PaginationProductsPageCopyWith(_PaginationProductsPage value, $Res Function(_PaginationProductsPage) _then) = __$PaginationProductsPageCopyWithImpl;
@override @useResult
$Res call({
 List<PaginationProduct> products, int total
});




}
/// @nodoc
class __$PaginationProductsPageCopyWithImpl<$Res>
    implements _$PaginationProductsPageCopyWith<$Res> {
  __$PaginationProductsPageCopyWithImpl(this._self, this._then);

  final _PaginationProductsPage _self;
  final $Res Function(_PaginationProductsPage) _then;

/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? total = null,}) {
  return _then(_PaginationProductsPage(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<PaginationProduct>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
