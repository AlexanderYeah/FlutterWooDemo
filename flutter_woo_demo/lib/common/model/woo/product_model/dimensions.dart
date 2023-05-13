class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height});

  @override
  String toString() {
    return 'Dimensions(length: $length, width: $width, height: $height)';
  }

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      length: json['length'] as String?,
      width: json['width'] as String?,
      height: json['height'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'width': width,
      'height': height,
    };
  }
}
