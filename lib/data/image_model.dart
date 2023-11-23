class ImageURL {
  String id;
  String url;
  int width;
  int height;

  ImageURL(this.id, this.url, this.width, this.height);

  ImageURL.fromMap(Map<String, dynamic> map) : this(map['id'], map['url'], map['width'], map['height']);
}
