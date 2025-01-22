// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) => PhoneModel(
      type: $enumDecode(_$PhoneTypeEnumMap, json['type']),
      number: json['number'] as String,
    );

Map<String, dynamic> _$PhoneModelToJson(PhoneModel instance) =>
    <String, dynamic>{
      'type': _$PhoneTypeEnumMap[instance.type]!,
      'number': instance.number,
    };

const _$PhoneTypeEnumMap = {
  PhoneType.mobile: 'mobile',
  PhoneType.home: 'home',
  PhoneType.work: 'work',
  PhoneType.other: 'other',
};
