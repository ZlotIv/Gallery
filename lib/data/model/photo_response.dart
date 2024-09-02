import 'package:gallery_project/data/model/hit_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/photo_response.g.dart';

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

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => _$PhotoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);
}
