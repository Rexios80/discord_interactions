// GENERATED CODE - DO NOT MODIFY BY HAND

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
      accentColor: json['accent_color'] as int?,
      locale: json['locale'] as String?,
      verified: json['verified'] as bool?,
      email: json['email'] as String?,
      flags: const UserFlagConverter().fromJson(json['flags'] as int?),
      premiumType:
          $enumDecodeNullable(_$PremiumTypeEnumMap, json['premium_type']),
      publicFlags:
          const UserFlagConverter().fromJson(json['public_flags'] as int?),
      member: json['member'] == null
          ? null
          : GuildMember.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'username': instance.username,
    'discriminator': instance.discriminator,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatar', instance.avatar);
  writeNotNull('bot', instance.bot);
  writeNotNull('system', instance.system);
  writeNotNull('mfa_enabled', instance.mfaEnabled);
  writeNotNull('banner', instance.banner);
  writeNotNull('accent_color', instance.accentColor);
  writeNotNull('locale', instance.locale);
  writeNotNull('verified', instance.verified);
  writeNotNull('email', instance.email);
  writeNotNull('flags', const UserFlagConverter().toJson(instance.flags));
  writeNotNull('premium_type', _$PremiumTypeEnumMap[instance.premiumType]);
  writeNotNull(
      'public_flags', const UserFlagConverter().toJson(instance.publicFlags));
  writeNotNull('member', instance.member);
  return val;
}

const _$PremiumTypeEnumMap = {
  PremiumType.none: 0,
  PremiumType.nitroClassic: 1,
  PremiumType.nitro: 2,
};
