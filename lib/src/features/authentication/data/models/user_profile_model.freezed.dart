// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  String get profilePic => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get userWeight => throw _privateConstructorUsedError;
  String get userHeight => throw _privateConstructorUsedError;
  String get userFitnessLevel => throw _privateConstructorUsedError;
  List<String> get preferences => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {String profilePic,
      String uid,
      String userWeight,
      String userHeight,
      String userFitnessLevel,
      List<String> preferences,
      String userEmail});
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePic = null,
    Object? uid = null,
    Object? userWeight = null,
    Object? userHeight = null,
    Object? userFitnessLevel = null,
    Object? preferences = null,
    Object? userEmail = null,
  }) {
    return _then(_value.copyWith(
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userWeight: null == userWeight
          ? _value.userWeight
          : userWeight // ignore: cast_nullable_to_non_nullable
              as String,
      userHeight: null == userHeight
          ? _value.userHeight
          : userHeight // ignore: cast_nullable_to_non_nullable
              as String,
      userFitnessLevel: null == userFitnessLevel
          ? _value.userFitnessLevel
          : userFitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileModelCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$_UserProfileModelCopyWith(
          _$_UserProfileModel value, $Res Function(_$_UserProfileModel) then) =
      __$$_UserProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String profilePic,
      String uid,
      String userWeight,
      String userHeight,
      String userFitnessLevel,
      List<String> preferences,
      String userEmail});
}

/// @nodoc
class __$$_UserProfileModelCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$_UserProfileModel>
    implements _$$_UserProfileModelCopyWith<$Res> {
  __$$_UserProfileModelCopyWithImpl(
      _$_UserProfileModel _value, $Res Function(_$_UserProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePic = null,
    Object? uid = null,
    Object? userWeight = null,
    Object? userHeight = null,
    Object? userFitnessLevel = null,
    Object? preferences = null,
    Object? userEmail = null,
  }) {
    return _then(_$_UserProfileModel(
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userWeight: null == userWeight
          ? _value.userWeight
          : userWeight // ignore: cast_nullable_to_non_nullable
              as String,
      userHeight: null == userHeight
          ? _value.userHeight
          : userHeight // ignore: cast_nullable_to_non_nullable
              as String,
      userFitnessLevel: null == userFitnessLevel
          ? _value.userFitnessLevel
          : userFitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      preferences: null == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileModel implements _UserProfileModel {
  _$_UserProfileModel(
      {required this.profilePic,
      required this.uid,
      required this.userWeight,
      required this.userHeight,
      required this.userFitnessLevel,
      required final List<String> preferences,
      required this.userEmail})
      : _preferences = preferences;

  factory _$_UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileModelFromJson(json);

  @override
  final String profilePic;
  @override
  final String uid;
  @override
  final String userWeight;
  @override
  final String userHeight;
  @override
  final String userFitnessLevel;
  final List<String> _preferences;
  @override
  List<String> get preferences {
    if (_preferences is EqualUnmodifiableListView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferences);
  }

  @override
  final String userEmail;

  @override
  String toString() {
    return 'UserProfileModel(profilePic: $profilePic, uid: $uid, userWeight: $userWeight, userHeight: $userHeight, userFitnessLevel: $userFitnessLevel, preferences: $preferences, userEmail: $userEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileModel &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userWeight, userWeight) ||
                other.userWeight == userWeight) &&
            (identical(other.userHeight, userHeight) ||
                other.userHeight == userHeight) &&
            (identical(other.userFitnessLevel, userFitnessLevel) ||
                other.userFitnessLevel == userFitnessLevel) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      profilePic,
      uid,
      userWeight,
      userHeight,
      userFitnessLevel,
      const DeepCollectionEquality().hash(_preferences),
      userEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileModelCopyWith<_$_UserProfileModel> get copyWith =>
      __$$_UserProfileModelCopyWithImpl<_$_UserProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileModelToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  factory _UserProfileModel(
      {required final String profilePic,
      required final String uid,
      required final String userWeight,
      required final String userHeight,
      required final String userFitnessLevel,
      required final List<String> preferences,
      required final String userEmail}) = _$_UserProfileModel;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$_UserProfileModel.fromJson;

  @override
  String get profilePic;
  @override
  String get uid;
  @override
  String get userWeight;
  @override
  String get userHeight;
  @override
  String get userFitnessLevel;
  @override
  List<String> get preferences;
  @override
  String get userEmail;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileModelCopyWith<_$_UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
