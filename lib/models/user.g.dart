// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      age: (json['age'] as num?)?.toInt() ?? 0,
      city: json['sehir'] as String?,
      isActive: json['is_active'] as bool?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String,
      hobbies:
          (json['hobbies'] as List<dynamic>).map((e) => e as String).toList(),
      registeredAt: json['registered_at'] as String,
      phoneNumber: (json['phone_number'] as List<dynamic>?)
              ?.map((e) => PhoneModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'sehir': instance.city,
      'email': instance.email,
      'hobbies': instance.hobbies,
      'is_active': instance.isActive,
      'registered_at': instance.registeredAt,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
    };
