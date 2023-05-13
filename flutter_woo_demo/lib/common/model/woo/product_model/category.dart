class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  @override
  String toString() => 'Category(id: $id, name: $name, slug: $slug)';

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }
}
