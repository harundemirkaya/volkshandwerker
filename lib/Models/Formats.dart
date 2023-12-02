class Formats {
  Large? large;
  Large? small;
  Large? medium;
  Large? thumbnail;

  Formats({this.large, this.small, this.medium, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    large = json['large'] != null ? Large.fromJson(json['large']) : null;
    small = json['small'] != null ? Large.fromJson(json['small']) : null;
    medium = json['medium'] != null ? Large.fromJson(json['medium']) : null;
    thumbnail =
        json['thumbnail'] != null ? Large.fromJson(json['thumbnail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}

class Large {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  String? path;
  double? size;
  int? width;
  int? height;

  Large(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height});

  Large.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = double.parse(json['size'].toString() ?? '0');
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext'] = ext;
    data['url'] = url;
    data['hash'] = hash;
    data['mime'] = mime;
    data['name'] = name;
    data['path'] = path;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
