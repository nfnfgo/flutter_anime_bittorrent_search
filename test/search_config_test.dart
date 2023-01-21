import 'package:flutter_anime_bittorrent_search/src/search_config.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_anime_bittorrent_search/flutter_anime_bittorrent_search.dart';

void main() {
  group('TorrentSearchConfig class:', () {
    TorrentSearchConfig config =
        TorrentSearchConfig(platform: TorrentSourcePlatform.other);
    test('toString', (() {
      expect(config.toString(), '{"platform":"Others"}');
    }));
    test('fromString', (() {
      TorrentSearchConfig config1 =
          TorrentSearchConfig.fromString('{"platform":"Others"}');
      expect(config1.toString(), config.toString());
    }));
  });

  group('TorrentSourcePlatform', () {
    test('fromString', () {
      TorrentSourcePlatform platform1 = TorrentSourcePlatform.other;
      TorrentSourcePlatform platform2 =
          TorrentSourcePlatform.fromString('Others');
      expect(platform1, platform2);
    });
  });
}
