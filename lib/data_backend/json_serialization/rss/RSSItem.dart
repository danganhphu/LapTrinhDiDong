
abstract class RSSItem {
  String? title;
  String? pubDate;
  String? description;
  String? link;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'date': this.pubDate,
      'description': this.description,
      'link': this.link,
      'imageUrl': this.imageUrl
    };
  }

  RSSItem getRSSFromJson(Map<String, dynamic> json) {
    title = json['title'];
    pubDate = json['pubDate'];
    description = _getDescription(json['description']);
    link = json['link'];
    imageUrl = _getImageUrl(json['imageUrl']);
    return this;
  }

  String _getDescription(String rawDescription);
  String? _getImageUrl(String rawImageUrl);

}

class VNExpressRSSItem extends RSSItem {

  @override
  String _getDescription(String rawDescription) {
    int start = rawDescription.indexOf('</a></br>') + 9;

    if (start > 9) {
      return rawDescription.substring(start);
    }
    return '';
  }

  @override
  String? _getImageUrl(String rawImageUrl) {
    int start = rawImageUrl.indexOf('img src="') + 9;
    if (start > 9) {
      int end = rawImageUrl.indexOf('"', start);
      return rawImageUrl.substring(start, end);
    }

    return null;
  }

}