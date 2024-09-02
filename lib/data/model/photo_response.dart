import 'package:gallery_project/data/model/hit_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/photo_response.g.dart';

/// A class representing a response containing photo hits.
@JsonSerializable()
final class PhotoResponse {
  final int total;
  final int totalHits;
  final List<HitResponse> hits;

  PhotoResponse({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  /// Creates a [PhotoResponse] from a JSON object.
  factory PhotoResponse.fromJson(Map<String, dynamic> json) => _$PhotoResponseFromJson(json);
  /// Converts the [PhotoResponse] to a JSON object.
  Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);
}
