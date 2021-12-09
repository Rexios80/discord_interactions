import 'package:dio/dio.dart';

/// Access to the Guild Templates API
///
/// https://discord.com/developers/docs/resources/guild-template#guild-template-resource
class GuildTemplatesApi {
  static const _basePath = '/guilds';

  final Dio _dio;

  /// Constructor
  GuildTemplatesApi(this._dio);

  /// Returns a guild template object for the given [code].
  /// 
  /// https://discord.com/developers/docs/resources/guild-template#get-guild-template
  
}
