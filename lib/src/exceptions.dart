/// Usually throw when the data and field that user wants to search are illegal.
/// For example, an empty animeName is not allowed
class TorrentSearchInputException implements Exception {
  String? msg;

  TorrentSearchInputException(this.msg);

  @override
  String toString() {
    if (msg == null) {
      return 'TorrentSearchInputException';
    }
    return 'TorrentSearchInputException: $msg';
  }
}
