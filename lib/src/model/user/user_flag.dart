/// User flags
///
/// https://discord.com/developers/docs/resources/user#user-object-user-flags
enum UserFlag {
  /// Discord Employee
  staff,

  /// Partnered Server Owner
  partner,

  /// HypeSquad Events Coordinator
  hypesquad,

  /// Bug Hunter Level 1
  bugHunterLevel1,

  /// House Bravery Member
  hypesquadOnlineHouse1,

  /// House Brilliance Member
  hypesquadOnlineHouse2,

  /// House Balance Member
  hypesquadOnlineHouse3,

  /// Early Nitro Supporter
  premiumEarlySupporter,

  /// User is a team
  teamPseudoUser,

  /// Bug Hunter Level 2
  bugHunterLevel2,

  /// Verified Bot
  verifiedBot,

  /// Early Verified Bot Developer
  verifiedDeveloper,

  /// Discord Certified Moderator
  certifiedModerator,

  /// Bot uses only HTTP interactions and is shown in the online member list
  botHttpInteractions,
}

/// Extension to convert flags to values
extension UserFlagExtension on UserFlag {
  /// Byte values of the flags
  int get value {
    switch (this) {
      case UserFlag.staff:
        return 1 << 0;
      case UserFlag.partner:
        return 1 << 1;
      case UserFlag.hypesquad:
        return 1 << 2;
      case UserFlag.bugHunterLevel1:
        return 1 << 3;
      case UserFlag.hypesquadOnlineHouse1:
        return 1 << 6;
      case UserFlag.hypesquadOnlineHouse2:
        return 1 << 7;
      case UserFlag.hypesquadOnlineHouse3:
        return 1 << 8;
      case UserFlag.premiumEarlySupporter:
        return 1 << 9;
      case UserFlag.teamPseudoUser:
        return 1 << 10;
      case UserFlag.bugHunterLevel2:
        return 1 << 14;
      case UserFlag.verifiedBot:
        return 1 << 16;
      case UserFlag.verifiedDeveloper:
        return 1 << 17;
      case UserFlag.certifiedModerator:
        return 1 << 18;
      case UserFlag.botHttpInteractions:
        return 1 << 19;
    }
  }
}
