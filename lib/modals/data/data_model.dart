import 'dart:convert';

import 'package:collection/collection.dart';

class DataModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  DataModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory DataModel.fromMap(Map<String, dynamic> data) => DataModel(
        albumId: data['albumId'] as int?,
        id: data['id'] as int?,
        title: data['title'] as String?,
        url: data['url'] as String?,
        thumbnailUrl: data['thumbnailUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DataModel].
  factory DataModel.fromJson(String data) {
    return DataModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;

  DataModel.empty();
}
