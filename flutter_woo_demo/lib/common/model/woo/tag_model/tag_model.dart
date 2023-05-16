import 'links.dart';

class TagModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? count;
  Links? links;

  TagModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.count,
    this.links,
  });

  @override
  String toString() {
    return 'TagModel(id: $id, name: $name, slug: $slug, description: $description, count: $count, links: $links)';
  }

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      count: json['count'] as int?,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'count': count,
      '_links': links?.toJson(),
    };
  }
}
