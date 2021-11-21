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
      publicFlags: (json['public_flags'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$UserFlagEnumMap, e))
          .toList(),
      member: json['member'] == null
          ? null
          : GuildMember.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'discriminator': instance.discriminator,
      'avatar': instance.avatar,
      'bot': instance.bot,
      'system': instance.system,
      'mfa_enabled': instance.mfaEnabled,
      'banner': instance.banner,
      'accent_color': instance.accentColor,
      'locale': instance.locale,
      'verified': instance.verified,
      'email': instance.email,
      'flags': const UserFlagConverter().toJson(instance.flags),
      'premium_type': _$PremiumTypeEnumMap[instance.premiumType],
      'public_flags':
          instance.publicFlags?.map((e) => _$UserFlagEnumMap[e]).toList(),
      'member': instance.member,
    };

const _$PremiumTypeEnumMap = {
  PremiumType.none: 0,
  PremiumType.nitroClassic: 1,
  PremiumType.nitro: 2,
};

const _$UserFlagEnumMap = {
  UserFlag.staff: 'staff',
  UserFlag.partner: 'partner',
  UserFlag.hypesquad: 'hypesquad',
  UserFlag.bugHunterLevel1: 'bugHunterLevel1',
  UserFlag.hypesquadOnlineHouse1: 'hypesquadOnlineHouse1',
  UserFlag.hypesquadOnlineHouse2: 'hypesquadOnlineHouse2',
  UserFlag.hypesquadOnlineHouse3: 'hypesquadOnlineHouse3',
  UserFlag.premiumEarlySupporter: 'premiumEarlySupporter',
  UserFlag.teamPseudoUser: 'teamPseudoUser',
  UserFlag.bugHunterLevel2: 'bugHunterLevel2',
  UserFlag.verifiedBot: 'verifiedBot',
  UserFlag.verifiedDeveloper: 'verifiedDeveloper',
  UserFlag.certifiedModerator: 'certifiedModerator',
  UserFlag.botHttpInteractions: 'botHttpInteractions',
};
