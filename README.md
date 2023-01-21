A more convenient way to search anime/manga torrent magnet in Flutter/Dart

## Quick Start

It's quite easy to start a search by using this package

```Dart
import 'package:flutter_anime_bittorrent_search/flutter_anime_bittorrent_search.dart';

void main() async {
  try {
    TorrentSearchResult result = await searchDMHY(animeName: 'Bocchi the rock');
    print('SearchTimeStamp: ${result.searchTime}');
    for (TorrentSearchResultItem item in result.results) {
      print(item.title ?? 'No title');
      print(item.magnet ?? 'No magnet');
    }
  } on TorrentSearchInputException {
    print('Invalid Input');
  } catch (e) {
    print(e);
  }
}
```

For more info, you can read the Full API Reference

# Other Info

## SourcePlatform

Until now, this package only support searching magnet on DMHY, we will consider adding more availble source platform in the future.