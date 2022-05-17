import 'dart:convert';

import 'product.dart';

class AdBanner {
  final String id;
  final String tag;
  final String title;
  final String? image;
  final String? video;
  final Product product;
  AdBanner({
    required this.id,
    required this.tag,
    required this.title,
    this.image,
    this.video,
    required this.product,
  });

  AdBanner copyWith({
    String? id,
    String? tag,
    String? title,
    String? image,
    String? video,
    Product? product,
  }) {
    return AdBanner(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      title: title ?? this.title,
      image: image ?? this.image,
      video: video ?? this.video,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'tag': tag});
    result.addAll({'title': title});
    if (image != null) {
      result.addAll({'image': image});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    result.addAll({'product': product.toMap()});

    return result;
  }

  factory AdBanner.fromMap(Map<String, dynamic> map) {
    return AdBanner(
      id: map['id'] ?? '',
      tag: map['tag'] ?? '',
      title: map['title'] ?? '',
      image: map['image'],
      video: map['video'],
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdBanner.fromJson(String source) =>
      AdBanner.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdBanner(id: $id, tag: $tag, title: $title, image: $image, video: $video, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdBanner &&
        other.id == id &&
        other.tag == tag &&
        other.title == title &&
        other.image == image &&
        other.video == video &&
        other.product == product;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tag.hashCode ^
        title.hashCode ^
        image.hashCode ^
        video.hashCode ^
        product.hashCode;
  }
}
