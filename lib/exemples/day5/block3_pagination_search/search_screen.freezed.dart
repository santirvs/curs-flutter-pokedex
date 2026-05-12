// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchProduct {

 int get id; String get title; double get price;
/// Create a copy of SearchProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProductCopyWith<SearchProduct> get copyWith => _$SearchProductCopyWithImpl<SearchProduct>(this as SearchProduct, _$identity);

  /// Serializes this SearchProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price);

@override
String toString() {
  return 'SearchProduct(id: $id, title: $title, price: $price)';
}


}

/// @nodoc
abstract mixin class $SearchProductCopyWith<$Res>  {
  factory $SearchProductCopyWith(SearchProduct value, $Res Function(SearchProduct) _then) = _$SearchProductCopyWithImpl;
@useResult
$Res call({
 int id, String title, double price
});




}
/// @nodoc
class _$SearchProductCopyWithImpl<$Res>
    implements $SearchProductCopyWith<$Res> {
  _$SearchProductCopyWithImpl(this._self, this._then);

  final SearchProduct _self;
  final $Res Function(SearchProduct) _then;

/// Create a copy of SearchProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchProduct].
extension SearchProductPatterns on SearchProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProduct value)  $default,){
final _that = this;
switch (_that) {
case _SearchProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProduct value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProduct() when $default != null:
return $default(_that.id,_that.title,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  double price)  $default,) {final _that = this;
switch (_that) {
case _SearchProduct():
return $default(_that.id,_that.title,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  double price)?  $default,) {final _that = this;
switch (_that) {
case _SearchProduct() when $default != null:
return $default(_that.id,_that.title,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProduct implements SearchProduct {
  const _SearchProduct({required this.id, required this.title, required this.price});
  factory _SearchProduct.fromJson(Map<String, dynamic> json) => _$SearchProductFromJson(json);

@override final  int id;
@override final  String title;
@override final  double price;

/// Create a copy of SearchProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProductCopyWith<_SearchProduct> get copyWith => __$SearchProductCopyWithImpl<_SearchProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price);

@override
String toString() {
  return 'SearchProduct(id: $id, title: $title, price: $price)';
}


}

/// @nodoc
abstract mixin class _$SearchProductCopyWith<$Res> implements $SearchProductCopyWith<$Res> {
  factory _$SearchProductCopyWith(_SearchProduct value, $Res Function(_SearchProduct) _then) = __$SearchProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, double price
});




}
/// @nodoc
class __$SearchProductCopyWithImpl<$Res>
    implements _$SearchProductCopyWith<$Res> {
  __$SearchProductCopyWithImpl(this._self, this._then);

  final _SearchProduct _self;
  final $Res Function(_SearchProduct) _then;

/// Create a copy of SearchProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? price = null,}) {
  return _then(_SearchProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SearchProductsResult {

 List<SearchProduct> get products;
/// Create a copy of SearchProductsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProductsResultCopyWith<SearchProductsResult> get copyWith => _$SearchProductsResultCopyWithImpl<SearchProductsResult>(this as SearchProductsResult, _$identity);

  /// Serializes this SearchProductsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProductsResult&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'SearchProductsResult(products: $products)';
}


}

/// @nodoc
abstract mixin class $SearchProductsResultCopyWith<$Res>  {
  factory $SearchProductsResultCopyWith(SearchProductsResult value, $Res Function(SearchProductsResult) _then) = _$SearchProductsResultCopyWithImpl;
@useResult
$Res call({
 List<SearchProduct> products
});




}
/// @nodoc
class _$SearchProductsResultCopyWithImpl<$Res>
    implements $SearchProductsResultCopyWith<$Res> {
  _$SearchProductsResultCopyWithImpl(this._self, this._then);

  final SearchProductsResult _self;
  final $Res Function(SearchProductsResult) _then;

/// Create a copy of SearchProductsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<SearchProduct>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchProductsResult].
extension SearchProductsResultPatterns on SearchProductsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProductsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProductsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProductsResult value)  $default,){
final _that = this;
switch (_that) {
case _SearchProductsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProductsResult value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProductsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchProduct> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProductsResult() when $default != null:
return $default(_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchProduct> products)  $default,) {final _that = this;
switch (_that) {
case _SearchProductsResult():
return $default(_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchProduct> products)?  $default,) {final _that = this;
switch (_that) {
case _SearchProductsResult() when $default != null:
return $default(_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProductsResult implements SearchProductsResult {
  const _SearchProductsResult({final  List<SearchProduct> products = const <SearchProduct>[]}): _products = products;
  factory _SearchProductsResult.fromJson(Map<String, dynamic> json) => _$SearchProductsResultFromJson(json);

 final  List<SearchProduct> _products;
@override@JsonKey() List<SearchProduct> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of SearchProductsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProductsResultCopyWith<_SearchProductsResult> get copyWith => __$SearchProductsResultCopyWithImpl<_SearchProductsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProductsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProductsResult&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'SearchProductsResult(products: $products)';
}


}

/// @nodoc
abstract mixin class _$SearchProductsResultCopyWith<$Res> implements $SearchProductsResultCopyWith<$Res> {
  factory _$SearchProductsResultCopyWith(_SearchProductsResult value, $Res Function(_SearchProductsResult) _then) = __$SearchProductsResultCopyWithImpl;
@override @useResult
$Res call({
 List<SearchProduct> products
});




}
/// @nodoc
class __$SearchProductsResultCopyWithImpl<$Res>
    implements _$SearchProductsResultCopyWith<$Res> {
  __$SearchProductsResultCopyWithImpl(this._self, this._then);

  final _SearchProductsResult _self;
  final $Res Function(_SearchProductsResult) _then;

/// Create a copy of SearchProductsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(_SearchProductsResult(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<SearchProduct>,
  ));
}


}

// dart format on
