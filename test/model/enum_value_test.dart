// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

void main() {
  test('AuditLogChangeKey value', () {
    for (final enumValue in AuditLogChangeKey.values) {
      final value = enumValue.value;
      final fromValue = AuditLogChangeKeyExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('ChannelType value', () {
    for (final enumValue in ChannelType.values) {
      final value = enumValue.value;
      final fromValue = ChannelTypeExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('ThreadAutoArchiveDuration value', () {
    for (final enumValue in ThreadAutoArchiveDuration.values) {
      final value = enumValue.value;
      final fromValue = ThreadAutoArchiveDurationExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('DefaultMessageNotificationLevel', () {
    for (final enumValue in DefaultMessageNotificationLevel.values) {
      final value = enumValue.value;
      final fromValue =
          DefaultMessageNotificationLevelExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('VerificationLevel value', () {
    for (final enumValue in VerificationLevel.values) {
      final value = enumValue.value;
      final fromValue = VerificationLevelExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('GuildScheduledEventStatus value', () {
    for (final enumValue in GuildScheduledEventStatus.values) {
      final value = enumValue.value;
      final fromValue = GuildScheduledEventStatusExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('PrivacyLevel value', () {
    for (final enumValue in PrivacyLevel.values) {
      final value = enumValue.value;
      final fromValue = PrivacyLevelExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('StickerFormatType value', () {
    for (final enumValue in StickerFormatType.values) {
      final value = enumValue.value;
      final fromValue = StickerFormatTypeExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('ExplicitContentFilterLevel value', () {
    for (final enumValue in ExplicitContentFilterLevel.values) {
      final value = enumValue.value;
      final fromValue = ExplicitContentFilterLevelExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });

  test('VideoQualityMode value', () {
    for (final enumValue in VideoQualityMode.values) {
      final value = enumValue.value;
      final fromValue = VideoQualityModeExtension.fromValue(value);
      expect(fromValue, enumValue);
    }
  });
}
