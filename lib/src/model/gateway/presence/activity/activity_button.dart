/// Activity Button structure
///
/// When received over the gateway, the buttons field is an array of strings,
/// which are the button labels. Bots cannot access a user's activity button
/// URLs. When sending, the buttons field must be an array of the below object:
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-buttons
class ActivityButton {
  /// the text shown on the button (1-32 characters)
  final String label;

  /// the url opened when clicking the button (1-512 characters)
  final String? url;

  /// Constructor
  ActivityButton({required this.label, this.url});

  /// To json
  Map<String, dynamic> toJson() => {
        'label': label,
        'url': url,
      };
}
