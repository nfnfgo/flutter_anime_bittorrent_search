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
