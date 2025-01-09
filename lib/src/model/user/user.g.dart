// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      username: json['username'] as String,
      discriminator: json['discriminator'] as String,
      avatar: json['avatar'] as String?,
      bot: json['bot'] as bool?,
      system: json['system'] as bool?,
      mfaEnabled: json['mfa_enabled'] as bool?,
      banner: json['banner'] as String?,
      accentColor: (json['accent_color'] as num?)?.toInt(),
      locale: json['locale'] as String?,
      verified: json['verified'] as bool?,
      email: json['email'] as String?,
      flags:
          const UserFlagConverter().fromJson((json['flags'] as num?)?.toInt()),
      premiumType:
          $enumDecodeNullable(_$PremiumTypeEnumMap, json['premium_type']),
      publicFlags: const UserFlagConverter()
          .fromJson((json['public_flags'] as num?)?.toInt()),
      member: json['member'] == null
          ? null
          : GuildMember.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'discriminator': instance.discriminator,
      if (instance.avatar case final value?) 'avatar': value,
      if (instance.bot case final value?) 'bot': value,
      if (instance.system case final value?) 'system': value,
      if (instance.mfaEnabled case final value?) 'mfa_enabled': value,
      if (instance.banner case final value?) 'banner': value,
      if (instance.accentColor case final value?) 'accent_color': value,
      if (instance.locale case final value?) 'locale': value,
      if (instance.verified case final value?) 'verified': value,
      if (instance.email case final value?) 'email': value,
      if (const UserFlagConverter().toJson(instance.flags) case final value?)
        'flags': value,
      if (_$PremiumTypeEnumMap[instance.premiumType] case final value?)
        'premium_type': value,
      if (const UserFlagConverter().toJson(instance.publicFlags)
          case final value?)
        'public_flags': value,
      if (instance.member case final value?) 'member': value,
    };

const _$PremiumTypeEnumMap = {
  PremiumType.none: 0,
  PremiumType.nitroClassic: 1,
  PremiumType.nitro: 2,
};
