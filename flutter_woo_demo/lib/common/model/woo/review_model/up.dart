class Up {
  String? href;

  Up({this.href});

  @override
  String toString() => 'Up(href: $href)';

  factory Up.fromJson(Map<String, dynamic> json) {
    return Up(
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
