class Attribute {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attribute({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  @override
  String toString() {
    return 'Attribute(id: $id, name: $name, position: $position, visible: $visible, variation: $variation, options: $options)';
  }

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'] as int?,
      name: json['name'] as String?,
      position: json['position'] as int?,
      visible: json['visible'] as bool?,
      variation: json['variation'] as bool?,
      // options: json['options'] as List<String>?,
      options: json['options']?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'visible': visible,
      'variation': variation,
      'options': options,
    };
  }
}
