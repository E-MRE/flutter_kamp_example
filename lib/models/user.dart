import 'package:flutter_kamp_example/models/address.dart';
import 'package:flutter_kamp_example/models/phone_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  User({
    this.name,
    this.age,
    this.city,
    this.isActive,
    this.address,
    required this.email,
    required this.hobbies,
    required this.registeredAt,
    required this.phoneNumber,
  });

  final String? name;
  @JsonKey(defaultValue: 0)
  final int? age;
  final String? city;
  final String email;
  final List<String> hobbies;
  final bool? isActive;
  final String registeredAt;
  final Address? address;
  @JsonKey(defaultValue: [])
  final List<PhoneModel> phoneNumber;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
