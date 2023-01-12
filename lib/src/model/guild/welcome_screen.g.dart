// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'welcome_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WelcomeScreen _$WelcomeScreenFromJson(Map<String, dynamic> json) =>
    WelcomeScreen(
      description: json['description'] as String?,
      welcomeChannels: (json['welcome_channels'] as List<dynamic>)
          .map((e) => WelcomeScreenChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WelcomeScreenToJson(WelcomeScreen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['welcome_channels'] = instance.welcomeChannels;
  return val;
}
