import 'dart:convert';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'exceptions.dart';
import 'search_result.dart';
import 'html_tools.dart';

Future<TorrentSearchResult?> searchDMHY({
  /// The name of the anime that you want to search
  required String animeName,
}) async {
  // validate animeName
  if (animeName == '') {
    throw TorrentSearchInputException('The animeName field can not be empty');
  }

  // constructing request url
  String urlStr = 'https://dmhy.b168.net/topics/rss/rss.xml?keyword=$animeName';
  // request url
  http.Response res = await http.get(Uri.parse(urlStr));
  // parsing data
  Document rssDoc = parse(utf8.decode(res.bodyBytes));
  TorrentSearchResult searchResult = TorrentSearchResult.fromDMHY(rssDoc);
  // return
  return searchResult;
}
