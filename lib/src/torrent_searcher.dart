/// Provide TorrentSearcher class, which allows you to serach anime torrent

/// An enum class, used to distinguish different torrent source platform
class TorrentSourcePlatform {
  /// [DMHY](https://dmhy.anoneko.com/) Anime Torrent Search Platform
  static final dhmy =
      TorrentSourcePlatform._interval('https://dmhy.anoneko.com/');
  static final other = TorrentSourcePlatform._interval('https://others.com/');

  /// The website of this bittorrent platform.
  ///
  /// e.g.:
  /// [https://dmhy.anoneko.com/](https://dmhy.anoneko.com/)
  final String platformSite;

  /// Interval constructor
  TorrentSourcePlatform._interval(this.platformSite);
}

/// The base class of the torrent searcher class
class TorrentSearcher {
  /// The anime name that you want to search for torrents
  String? animeName;

  /// Default Contructor
  TorrentSearcher({this.animeName});

  searchMagnet() {
    ;
  }
}
