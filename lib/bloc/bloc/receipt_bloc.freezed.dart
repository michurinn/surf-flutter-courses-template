// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReceiptEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String receiptId) load,
    required TResult Function(SortingFunction sortingFunction) sort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String receiptId)? load,
    TResult? Function(SortingFunction sortingFunction)? sort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String receiptId)? load,
    TResult Function(SortingFunction sortingFunction)? sort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Sort value) sort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Sort value)? sort,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Sort value)? sort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptEventCopyWith<$Res> {
  factory $ReceiptEventCopyWith(
          ReceiptEvent value, $Res Function(ReceiptEvent) then) =
      _$ReceiptEventCopyWithImpl<$Res, ReceiptEvent>;
}

/// @nodoc
class _$ReceiptEventCopyWithImpl<$Res, $Val extends ReceiptEvent>
    implements $ReceiptEventCopyWith<$Res> {
  _$ReceiptEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadCopyWith<$Res> {
  factory _$$_LoadCopyWith(_$_Load value, $Res Function(_$_Load) then) =
      __$$_LoadCopyWithImpl<$Res>;
  @useResult
  $Res call({String receiptId});
}

/// @nodoc
class __$$_LoadCopyWithImpl<$Res>
    extends _$ReceiptEventCopyWithImpl<$Res, _$_Load>
    implements _$$_LoadCopyWith<$Res> {
  __$$_LoadCopyWithImpl(_$_Load _value, $Res Function(_$_Load) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptId = null,
  }) {
    return _then(_$_Load(
      receiptId: null == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Load implements _Load {
  const _$_Load({required this.receiptId});

  @override
  final String receiptId;

  @override
  String toString() {
    return 'ReceiptEvent.load(receiptId: $receiptId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Load &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, receiptId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadCopyWith<_$_Load> get copyWith =>
      __$$_LoadCopyWithImpl<_$_Load>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String receiptId) load,
    required TResult Function(SortingFunction sortingFunction) sort,
  }) {
    return load(receiptId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String receiptId)? load,
    TResult? Function(SortingFunction sortingFunction)? sort,
  }) {
    return load?.call(receiptId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String receiptId)? load,
    TResult Function(SortingFunction sortingFunction)? sort,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(receiptId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Sort value) sort,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Sort value)? sort,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Sort value)? sort,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements ReceiptEvent {
  const factory _Load({required final String receiptId}) = _$_Load;

  String get receiptId;
  @JsonKey(ignore: true)
  _$$_LoadCopyWith<_$_Load> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SortCopyWith<$Res> {
  factory _$$_SortCopyWith(_$_Sort value, $Res Function(_$_Sort) then) =
      __$$_SortCopyWithImpl<$Res>;
  @useResult
  $Res call({SortingFunction sortingFunction});
}

/// @nodoc
class __$$_SortCopyWithImpl<$Res>
    extends _$ReceiptEventCopyWithImpl<$Res, _$_Sort>
    implements _$$_SortCopyWith<$Res> {
  __$$_SortCopyWithImpl(_$_Sort _value, $Res Function(_$_Sort) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortingFunction = null,
  }) {
    return _then(_$_Sort(
      sortingFunction: null == sortingFunction
          ? _value.sortingFunction
          : sortingFunction // ignore: cast_nullable_to_non_nullable
              as SortingFunction,
    ));
  }
}

/// @nodoc

class _$_Sort implements _Sort {
  const _$_Sort({required this.sortingFunction});

  @override
  final SortingFunction sortingFunction;

  @override
  String toString() {
    return 'ReceiptEvent.sort(sortingFunction: $sortingFunction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sort &&
            (identical(other.sortingFunction, sortingFunction) ||
                other.sortingFunction == sortingFunction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortingFunction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortCopyWith<_$_Sort> get copyWith =>
      __$$_SortCopyWithImpl<_$_Sort>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String receiptId) load,
    required TResult Function(SortingFunction sortingFunction) sort,
  }) {
    return sort(sortingFunction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String receiptId)? load,
    TResult? Function(SortingFunction sortingFunction)? sort,
  }) {
    return sort?.call(sortingFunction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String receiptId)? load,
    TResult Function(SortingFunction sortingFunction)? sort,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(sortingFunction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Sort value) sort,
  }) {
    return sort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Sort value)? sort,
  }) {
    return sort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Sort value)? sort,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(this);
    }
    return orElse();
  }
}

abstract class _Sort implements ReceiptEvent {
  const factory _Sort({required final SortingFunction sortingFunction}) =
      _$_Sort;

  SortingFunction get sortingFunction;
  @JsonKey(ignore: true)
  _$$_SortCopyWith<_$_Sort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReceiptState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductEntity> productEntityList) loaded,
    required TResult Function(List<ProductEntity> productEntityList) sorted,
    required TResult Function(List<ProductEntity> productEntityList)
        sortedByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductEntity> productEntityList)? loaded,
    TResult? Function(List<ProductEntity> productEntityList)? sorted,
    TResult? Function(List<ProductEntity> productEntityList)? sortedByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductEntity> productEntityList)? loaded,
    TResult Function(List<ProductEntity> productEntityList)? sorted,
    TResult Function(List<ProductEntity> productEntityList)? sortedByCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Sorted value) sorted,
    required TResult Function(_SortedByCategory value) sortedByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Sorted value)? sorted,
    TResult? Function(_SortedByCategory value)? sortedByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Sorted value)? sorted,
    TResult Function(_SortedByCategory value)? sortedByCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptStateCopyWith<$Res> {
  factory $ReceiptStateCopyWith(
          ReceiptState value, $Res Function(ReceiptState) then) =
      _$ReceiptStateCopyWithImpl<$Res, ReceiptState>;
}

/// @nodoc
class _$ReceiptStateCopyWithImpl<$Res, $Val extends ReceiptState>
    implements $ReceiptStateCopyWith<$Res> {
  _$ReceiptStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$ReceiptStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ReceiptState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductEntity> productEntityList) loaded,
    required TResult Function(List<ProductEntity> productEntityList) sorted,
    required TResult Function(List<ProductEntity> productEntityList)
        sortedByCategory,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductEntity> productEntityList)? loaded,
    TResult? Function(List<ProductEntity> productEntityList)? sorted,
    TResult? Function(List<ProductEntity> productEntityList)? sortedByCategory,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductEntity> productEntityList)? loaded,
    TResult Function(List<ProductEntity> productEntityList)? sorted,
    TResult Function(List<ProductEntity> productEntityList)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Sorted value) sorted,
    required TResult Function(_SortedByCategory value) sortedByCategory,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Sorted value)? sorted,
    TResult? Function(_SortedByCategory value)? sortedByCategory,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Sorted value)? sorted,
    TResult Function(_SortedByCategory value)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReceiptState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res>
    extends _$ReceiptStateCopyWithImpl<$Res, _$_Empty>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'ReceiptState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductEntity> productEntityList) loaded,
    required TResult Function(List<ProductEntity> productEntityList) sorted,
    required TResult Function(List<ProductEntity> productEntityList)
        sortedByCategory,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductEntity> productEntityList)? loaded,
    TResult? Function(List<ProductEntity> productEntityList)? sorted,
    TResult? Function(List<ProductEntity> productEntityList)? sortedByCategory,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductEntity> productEntityList)? loaded,
    TResult Function(List<ProductEntity> productEntityList)? sorted,
    TResult Function(List<ProductEntity> productEntityList)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Sorted value) sorted,
    required TResult Function(_SortedByCategory value) sortedByCategory,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Sorted value)? sorted,
    TResult? Function(_SortedByCategory value)? sortedByCategory,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Sorted value)? sorted,
    TResult Function(_SortedByCategory value)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements ReceiptState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductEntity> productEntityList});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$ReceiptStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productEntityList = null,
  }) {
    return _then(_$_Loaded(
      productEntityList: null == productEntityList
          ? _value._productEntityList
          : productEntityList // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required final List<ProductEntity> productEntityList})
      : _productEntityList = productEntityList;

  final List<ProductEntity> _productEntityList;
  @override
  List<ProductEntity> get productEntityList {
    if (_productEntityList is EqualUnmodifiableListView)
      return _productEntityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productEntityList);
  }

  @override
  String toString() {
    return 'ReceiptState.loaded(productEntityList: $productEntityList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality()
                .equals(other._productEntityList, _productEntityList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productEntityList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductEntity> productEntityList) loaded,
    required TResult Function(List<ProductEntity> productEntityList) sorted,
    required TResult Function(List<ProductEntity> productEntityList)
        sortedByCategory,
  }) {
    return loaded(productEntityList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductEntity> productEntityList)? loaded,
    TResult? Function(List<ProductEntity> productEntityList)? sorted,
    TResult? Function(List<ProductEntity> productEntityList)? sortedByCategory,
  }) {
    return loaded?.call(productEntityList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductEntity> productEntityList)? loaded,
    TResult Function(List<ProductEntity> productEntityList)? sorted,
    TResult Function(List<ProductEntity> productEntityList)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(productEntityList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Sorted value) sorted,
    required TResult Function(_SortedByCategory value) sortedByCategory,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Sorted value)? sorted,
    TResult? Function(_SortedByCategory value)? sortedByCategory,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Sorted value)? sorted,
    TResult Function(_SortedByCategory value)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ReceiptState {
  const factory _Loaded(
      {required final List<ProductEntity> productEntityList}) = _$_Loaded;

  List<ProductEntity> get productEntityList;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SortedCopyWith<$Res> {
  factory _$$_SortedCopyWith(_$_Sorted value, $Res Function(_$_Sorted) then) =
      __$$_SortedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductEntity> productEntityList});
}

/// @nodoc
class __$$_SortedCopyWithImpl<$Res>
    extends _$ReceiptStateCopyWithImpl<$Res, _$_Sorted>
    implements _$$_SortedCopyWith<$Res> {
  __$$_SortedCopyWithImpl(_$_Sorted _value, $Res Function(_$_Sorted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productEntityList = null,
  }) {
    return _then(_$_Sorted(
      productEntityList: null == productEntityList
          ? _value._productEntityList
          : productEntityList // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
    ));
  }
}

/// @nodoc

class _$_Sorted implements _Sorted {
  const _$_Sorted({required final List<ProductEntity> productEntityList})
      : _productEntityList = productEntityList;

  final List<ProductEntity> _productEntityList;
  @override
  List<ProductEntity> get productEntityList {
    if (_productEntityList is EqualUnmodifiableListView)
      return _productEntityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productEntityList);
  }

  @override
  String toString() {
    return 'ReceiptState.sorted(productEntityList: $productEntityList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sorted &&
            const DeepCollectionEquality()
                .equals(other._productEntityList, _productEntityList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productEntityList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortedCopyWith<_$_Sorted> get copyWith =>
      __$$_SortedCopyWithImpl<_$_Sorted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductEntity> productEntityList) loaded,
    required TResult Function(List<ProductEntity> productEntityList) sorted,
    required TResult Function(List<ProductEntity> productEntityList)
        sortedByCategory,
  }) {
    return sorted(productEntityList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductEntity> productEntityList)? loaded,
    TResult? Function(List<ProductEntity> productEntityList)? sorted,
    TResult? Function(List<ProductEntity> productEntityList)? sortedByCategory,
  }) {
    return sorted?.call(productEntityList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductEntity> productEntityList)? loaded,
    TResult Function(List<ProductEntity> productEntityList)? sorted,
    TResult Function(List<ProductEntity> productEntityList)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (sorted != null) {
      return sorted(productEntityList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Sorted value) sorted,
    required TResult Function(_SortedByCategory value) sortedByCategory,
  }) {
    return sorted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Sorted value)? sorted,
    TResult? Function(_SortedByCategory value)? sortedByCategory,
  }) {
    return sorted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Sorted value)? sorted,
    TResult Function(_SortedByCategory value)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (sorted != null) {
      return sorted(this);
    }
    return orElse();
  }
}

abstract class _Sorted implements ReceiptState {
  const factory _Sorted(
      {required final List<ProductEntity> productEntityList}) = _$_Sorted;

  List<ProductEntity> get productEntityList;
  @JsonKey(ignore: true)
  _$$_SortedCopyWith<_$_Sorted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SortedByCategoryCopyWith<$Res> {
  factory _$$_SortedByCategoryCopyWith(
          _$_SortedByCategory value, $Res Function(_$_SortedByCategory) then) =
      __$$_SortedByCategoryCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductEntity> productEntityList});
}

/// @nodoc
class __$$_SortedByCategoryCopyWithImpl<$Res>
    extends _$ReceiptStateCopyWithImpl<$Res, _$_SortedByCategory>
    implements _$$_SortedByCategoryCopyWith<$Res> {
  __$$_SortedByCategoryCopyWithImpl(
      _$_SortedByCategory _value, $Res Function(_$_SortedByCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productEntityList = null,
  }) {
    return _then(_$_SortedByCategory(
      productEntityList: null == productEntityList
          ? _value._productEntityList
          : productEntityList // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
    ));
  }
}

/// @nodoc

class _$_SortedByCategory implements _SortedByCategory {
  const _$_SortedByCategory(
      {required final List<ProductEntity> productEntityList})
      : _productEntityList = productEntityList;

  final List<ProductEntity> _productEntityList;
  @override
  List<ProductEntity> get productEntityList {
    if (_productEntityList is EqualUnmodifiableListView)
      return _productEntityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productEntityList);
  }

  @override
  String toString() {
    return 'ReceiptState.sortedByCategory(productEntityList: $productEntityList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortedByCategory &&
            const DeepCollectionEquality()
                .equals(other._productEntityList, _productEntityList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productEntityList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortedByCategoryCopyWith<_$_SortedByCategory> get copyWith =>
      __$$_SortedByCategoryCopyWithImpl<_$_SortedByCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductEntity> productEntityList) loaded,
    required TResult Function(List<ProductEntity> productEntityList) sorted,
    required TResult Function(List<ProductEntity> productEntityList)
        sortedByCategory,
  }) {
    return sortedByCategory(productEntityList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductEntity> productEntityList)? loaded,
    TResult? Function(List<ProductEntity> productEntityList)? sorted,
    TResult? Function(List<ProductEntity> productEntityList)? sortedByCategory,
  }) {
    return sortedByCategory?.call(productEntityList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductEntity> productEntityList)? loaded,
    TResult Function(List<ProductEntity> productEntityList)? sorted,
    TResult Function(List<ProductEntity> productEntityList)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (sortedByCategory != null) {
      return sortedByCategory(productEntityList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Sorted value) sorted,
    required TResult Function(_SortedByCategory value) sortedByCategory,
  }) {
    return sortedByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Sorted value)? sorted,
    TResult? Function(_SortedByCategory value)? sortedByCategory,
  }) {
    return sortedByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Sorted value)? sorted,
    TResult Function(_SortedByCategory value)? sortedByCategory,
    required TResult orElse(),
  }) {
    if (sortedByCategory != null) {
      return sortedByCategory(this);
    }
    return orElse();
  }
}

abstract class _SortedByCategory implements ReceiptState {
  const factory _SortedByCategory(
          {required final List<ProductEntity> productEntityList}) =
      _$_SortedByCategory;

  List<ProductEntity> get productEntityList;
  @JsonKey(ignore: true)
  _$$_SortedByCategoryCopyWith<_$_SortedByCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
