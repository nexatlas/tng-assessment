// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeState {
  List<Recipe> get recipes => throw _privateConstructorUsedError;
  List<Recipe> get filteredRecipes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        initial,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loading,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loaded,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult? Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeStateCopyWith<RecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStateCopyWith<$Res> {
  factory $RecipeStateCopyWith(
          RecipeState value, $Res Function(RecipeState) then) =
      _$RecipeStateCopyWithImpl<$Res, RecipeState>;
  @useResult
  $Res call({List<Recipe> recipes, List<Recipe> filteredRecipes});
}

/// @nodoc
class _$RecipeStateCopyWithImpl<$Res, $Val extends RecipeState>
    implements $RecipeStateCopyWith<$Res> {
  _$RecipeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? filteredRecipes = null,
  }) {
    return _then(_value.copyWith(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      filteredRecipes: null == filteredRecipes
          ? _value.filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RecipeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipes, List<Recipe> filteredRecipes});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? filteredRecipes = null,
  }) {
    return _then(_$InitialImpl(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      filteredRecipes: null == filteredRecipes
          ? _value._filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Recipe> recipes = const <Recipe>[],
      final List<Recipe> filteredRecipes = const <Recipe>[]})
      : _recipes = recipes,
        _filteredRecipes = filteredRecipes;

  final List<Recipe> _recipes;
  @override
  @JsonKey()
  List<Recipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  final List<Recipe> _filteredRecipes;
  @override
  @JsonKey()
  List<Recipe> get filteredRecipes {
    if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredRecipes);
  }

  @override
  String toString() {
    return 'RecipeState.initial(recipes: $recipes, filteredRecipes: $filteredRecipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            const DeepCollectionEquality()
                .equals(other._filteredRecipes, _filteredRecipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipes),
      const DeepCollectionEquality().hash(_filteredRecipes));

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        initial,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loading,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loaded,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)
        error,
  }) {
    return initial(recipes, filteredRecipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult? Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
  }) {
    return initial?.call(recipes, filteredRecipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(recipes, filteredRecipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RecipeState {
  const factory _Initial(
      {final List<Recipe> recipes,
      final List<Recipe> filteredRecipes}) = _$InitialImpl;

  @override
  List<Recipe> get recipes;
  @override
  List<Recipe> get filteredRecipes;

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $RecipeStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipes, List<Recipe> filteredRecipes});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? filteredRecipes = null,
  }) {
    return _then(_$LoadingImpl(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      filteredRecipes: null == filteredRecipes
          ? _value._filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {final List<Recipe> recipes = const <Recipe>[],
      final List<Recipe> filteredRecipes = const <Recipe>[]})
      : _recipes = recipes,
        _filteredRecipes = filteredRecipes;

  final List<Recipe> _recipes;
  @override
  @JsonKey()
  List<Recipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  final List<Recipe> _filteredRecipes;
  @override
  @JsonKey()
  List<Recipe> get filteredRecipes {
    if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredRecipes);
  }

  @override
  String toString() {
    return 'RecipeState.loading(recipes: $recipes, filteredRecipes: $filteredRecipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            const DeepCollectionEquality()
                .equals(other._filteredRecipes, _filteredRecipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipes),
      const DeepCollectionEquality().hash(_filteredRecipes));

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        initial,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loading,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loaded,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)
        error,
  }) {
    return loading(recipes, filteredRecipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult? Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
  }) {
    return loading?.call(recipes, filteredRecipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(recipes, filteredRecipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RecipeState {
  const factory _Loading(
      {final List<Recipe> recipes,
      final List<Recipe> filteredRecipes}) = _$LoadingImpl;

  @override
  List<Recipe> get recipes;
  @override
  List<Recipe> get filteredRecipes;

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $RecipeStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipes, List<Recipe> filteredRecipes});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? filteredRecipes = null,
  }) {
    return _then(_$LoadedImpl(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      filteredRecipes: null == filteredRecipes
          ? _value._filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<Recipe> recipes,
      required final List<Recipe> filteredRecipes})
      : _recipes = recipes,
        _filteredRecipes = filteredRecipes;

  final List<Recipe> _recipes;
  @override
  List<Recipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  final List<Recipe> _filteredRecipes;
  @override
  List<Recipe> get filteredRecipes {
    if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredRecipes);
  }

  @override
  String toString() {
    return 'RecipeState.loaded(recipes: $recipes, filteredRecipes: $filteredRecipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            const DeepCollectionEquality()
                .equals(other._filteredRecipes, _filteredRecipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipes),
      const DeepCollectionEquality().hash(_filteredRecipes));

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        initial,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loading,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loaded,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)
        error,
  }) {
    return loaded(recipes, filteredRecipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult? Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
  }) {
    return loaded?.call(recipes, filteredRecipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(recipes, filteredRecipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements RecipeState {
  const factory _Loaded(
      {required final List<Recipe> recipes,
      required final List<Recipe> filteredRecipes}) = _$LoadedImpl;

  @override
  List<Recipe> get recipes;
  @override
  List<Recipe> get filteredRecipes;

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $RecipeStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Recipe> recipes, List<Recipe> filteredRecipes, String? error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? filteredRecipes = null,
    Object? error = freezed,
  }) {
    return _then(_$ErrorImpl(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      filteredRecipes: null == filteredRecipes
          ? _value._filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(
      {final List<Recipe> recipes = const <Recipe>[],
      final List<Recipe> filteredRecipes = const <Recipe>[],
      this.error})
      : _recipes = recipes,
        _filteredRecipes = filteredRecipes;

  final List<Recipe> _recipes;
  @override
  @JsonKey()
  List<Recipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  final List<Recipe> _filteredRecipes;
  @override
  @JsonKey()
  List<Recipe> get filteredRecipes {
    if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredRecipes);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'RecipeState.error(recipes: $recipes, filteredRecipes: $filteredRecipes, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            const DeepCollectionEquality()
                .equals(other._filteredRecipes, _filteredRecipes) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipes),
      const DeepCollectionEquality().hash(_filteredRecipes),
      error);

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        initial,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loading,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes)
        loaded,
    required TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)
        error,
  }) {
    return error(recipes, filteredRecipes, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult? Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult? Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
  }) {
    return error?.call(recipes, filteredRecipes, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        initial,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loading,
    TResult Function(List<Recipe> recipes, List<Recipe> filteredRecipes)?
        loaded,
    TResult Function(
            List<Recipe> recipes, List<Recipe> filteredRecipes, String? error)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(recipes, filteredRecipes, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RecipeState {
  const factory _Error(
      {final List<Recipe> recipes,
      final List<Recipe> filteredRecipes,
      final String? error}) = _$ErrorImpl;

  @override
  List<Recipe> get recipes;
  @override
  List<Recipe> get filteredRecipes;
  String? get error;

  /// Create a copy of RecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
