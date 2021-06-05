import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_datamodels.freezed.dart';
part 'freezed_datamodels.g.dart';

@freezed
class Geo with _$Geo {
  const factory Geo({
    @Default(0.0) double lat,
    @Default(0.0) double lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @Default('') String street,
    @Default('') String suite,
    @Default('') String city,
    @Default('') String zipcode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Company with _$Company {
  const factory Company({
    @Default('') String name,
    @Default('') String catchPhrase,
    @Default('') String bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String email,
    Address? address,
    @Default('') String phone,
    @Default('') String website,
    Company? company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
