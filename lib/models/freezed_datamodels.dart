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
  const Address._();
  const factory Address({
    @Default('')
        String street,
    @Default('')
        String suite,
    @Default('')
        String city,
    @Default('')
        String zipcode,
    @JsonKey(
      fromJson: Address._geoFromJson,
      toJson: Address._geoToJson,
    )
        Geo? geo,
  }) = _Address;

  static Geo? _geoFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Geo.fromJson(json);
  }

  static Map<String, dynamic>? _geoToJson(Geo? geo) {
    if (geo == null) return null;

    return geo.toJson();
  }

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
  const User._();
  const factory User({
    required int id,
    required String username,
    required String email,
    @JsonKey(
      fromJson: User._addressFromJson,
      toJson: User._addressToJson,
    )
        Address? address,
    @Default('')
        String phone,
    @Default('')
        String website,
    @JsonKey(
      fromJson: User._companyFromJson,
      toJson: User._companyToJson,
    )
        Company? company,
  }) = _User;

  static Address? _addressFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Address.fromJson(json);
  }

  static Map<String, dynamic>? _addressToJson(Address? address) {
    if (address == null) return null;

    return address.toJson();
  }

  static Company? _companyFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Company.fromJson(json);
  }

  static Map<String, dynamic>? _companyToJson(Company? company) {
    if (company == null) return null;

    return company.toJson();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
