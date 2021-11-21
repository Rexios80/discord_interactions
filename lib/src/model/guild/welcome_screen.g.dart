// GENERATED CODE - DO NOT MODIFY BY HAND

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

Map<String, dynamic> _$WelcomeScreenToJson(WelcomeScreen instance) =>
    <String, dynamic>{
      'description': instance.description,
      'welcome_channels': instance.welcomeChannels,
    };
