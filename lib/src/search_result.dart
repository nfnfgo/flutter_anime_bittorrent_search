import 'package:html/dom.dart';

import 'search_config.dart';
import 'html_tools.dart';

class TorrentSearchResult {
  /// The source platform of the search result
  late final TorrentSourcePlatform? platform;

  /// The time of this search result, millisecondsSinceEpoch
  ///
  /// e.g: `8640000000000000`
  late final int? searchTime;

  /// The list of the results
  List<TorrentSearchResultItem> results = [];

  /// Construct TorrentSearchResult from DMHY returns info in `Document` type
  TorrentSearchResult.fromDMHY(Document rssDoc) {
    fromDMHY(rssDoc);
  }

  /// Update TorrentSearchResult from DMHY returns info in `Document` type
  fromDMHY(Document rssDoc) {
    // set source platform
    platform = TorrentSourcePlatform.dhmy;
    // set time
    searchTime = DateTime.now().millisecondsSinceEpoch;
    // iterate all items to get result
    List<Element> itemList = rssDoc.getElementsByTagName('item');
    Element resultEle;
    for (resultEle in itemList) {
      try {
        results.add(TorrentSearchResultItem.fromDMHY(resultEle));
      } catch (e) {}
    }
  }
}

class TorrentSearchResultItem {
  /// The title of this result, usually contains the anime name,
  /// video format and quality, subtitle translation groups name and so on
  ///
  /// e.g.:`【澄空学园&动漫国字幕组】★01月新番[转生公主与天才千金的魔法革命][03][1080P][简体][MP4]`
  String? title;

  /// The description of this torrent, usually added by the subtitle or publish group
  String? description;

  /// The magnet link string, which is start by 'magnet:?xt=urn:btih:'
  String? magnet;

  /// The source url of this search result
  ///
  /// e.g.:
  /// `http://share.dmhy.b168.net/topics/view/628450_Tensei_Oujo_to_Tensai_Reijou_no_Mahou_Kakumei_03_1080p.html`
  String? sourceUrl;

  /// Construct TorrentSearchResultItem from DMHY info in `Element` type
  TorrentSearchResultItem.fromDMHY(Element infoEle) {
    fromDMHY(infoEle);
  }

  /// Update TorrentSearchResultItem from DMHY info in `Element` type
  fromDMHY(Element infoEle) {
    // title
    try {
      title =
          HtmlTool.cleanCDATA(infoEle.getElementsByTagName('title')[0].text);
    } catch (e) {}

    // description
    try {
      description = HtmlTool.cleanCDATA(
          infoEle.getElementsByTagName('description')[0].text);
    } catch (e) {}

    // magnet
    try {
      magnet = HtmlTool.getHtmlInfo(
        html: infoEle.getElementsByTagName('enclosure')[0].outerHtml,
        type: 'url',
      );
      magnet = magnet?.replaceAll('&amp;', '&');
    } catch (e) {}
    print(title);
    print(magnet?.substring(0, 70));
  }
}
