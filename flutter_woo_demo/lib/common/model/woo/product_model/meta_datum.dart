class MetaDatum {
  int? id;
  String? key;
  String? value;

  MetaDatum({this.id, this.key, this.value});

  @override
  String toString() => 'MetaDatum(id: $id, key: $key, value: $value)';

  factory MetaDatum.fromJson(Map<String, dynamic> json) {
    return MetaDatum(
      id: json['id'] as int?,
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'value': value,
    };
  }
}
