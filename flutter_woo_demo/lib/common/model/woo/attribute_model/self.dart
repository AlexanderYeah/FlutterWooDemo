class Self {
  String? href;

  Self({this.href});

  @override
  String toString() => 'Self(href: $href)';

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
