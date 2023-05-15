class Collection {
  String? href;

  Collection({this.href});

  @override
  String toString() => 'Collection(href: $href)';

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
