import 'dart:convert';

/// An enum class, used to distinguish different torrent source platform
class TorrentSourcePlatform {
  /// [DMHY](https://dmhy.anoneko.com/) Anime Torrent Search Platform
  static final dhmy = TorrentSourcePlatform._interval('DMHY');
  static final other = TorrentSourcePlatform._interval('Others');

  /// The website of this bittorrent platform.
  ///
  /// e.g.:
  /// [https://dmhy.anoneko.com/](https://dmhy.anoneko.com/)
  final String platformName;

  /// Interval constructor
  TorrentSourcePlatform._interval(this.platformName);

  @override
  String toString() {
    return platformName;
  }

  factory TorrentSourcePlatform.fromString(String str) {
    if (str == 'DMHY') {
      return dhmy;
    } else if (str == 'Others') {
      return other;
    } else {
      throw Exception('Failed to find the source platform from string: $str');
    }
  }
}

class TorrentSearchConfig {
  /// Set the platform you want to use to search torrent, default to `dmhy`
  TorrentSourcePlatform? platform;

  /// Constructor
  TorrentSearchConfig({required this.platform}) {
    platform ??= TorrentSourcePlatform.dhmy;
  }

  TorrentSearchConfig.fromString(String jsonStr) {
    fromString(jsonStr);
  }

  /// toString method, convert TorrentSearchConfig instance to a
  /// String type info, usually used for persistent storage.
  @override
  String toString() {
    Map infoMap = {};

    // platform
    try {
      infoMap['platform'] = platform.toString();
    } catch (e) {}

    return jsonEncode(infoMap);
  }

  fromString(String jsonStr) {
    Map infoMap = jsonDecode(jsonStr);

    // platform
    try {
      platform = TorrentSourcePlatform.fromString(infoMap['platform']);
    } catch (e) {}
  }
}
