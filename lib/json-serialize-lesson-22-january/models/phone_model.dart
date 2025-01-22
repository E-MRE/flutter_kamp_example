import 'package:flutter_kamp_example/json-serialize-lesson-22-january/enums/phone_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_model.g.dart';

@JsonSerializable()
class PhoneModel {
  final PhoneType type;
  final String number;

  const PhoneModel({
    required this.type,
    required this.number,
  });

  PhoneModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
}
