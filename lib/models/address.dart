import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Address {
  const Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });

  final String street;
  final String city;
  @JsonKey(name: 'postal_code')
  final String zipCode;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
