import 'package:json_annotation/json_annotation.dart';

part 'generated/hit_response.g.dart';

/// A class representing a single photo hit response.
@JsonSerializable()
final class HitResponse {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String? largeImageURL;
  final String? fullHDURL;
  final String? imageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int likes;
  final int comments;
  final int user_id;
  final String user;
  final String userImageURL;

  HitResponse({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.fullHDURL,
    required this.imageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.user,
    required this.userImageURL,
  });

  /// A class representing a single photo hit response.
  factory HitResponse.fromJson(Map<String, dynamic> json) => _$HitResponseFromJson(json);
  /// Converts the [HitResponse] to a JSON object.
  Map<String, dynamic> toJson() => _$HitResponseToJson(this);
}
