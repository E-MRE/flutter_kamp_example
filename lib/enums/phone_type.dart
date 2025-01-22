import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PhoneType {
  mobile('mobile'),
  home('home'),
  work('work'),
  other('other');

  final String value;
  const PhoneType(this.value);
}
