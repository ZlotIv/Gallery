/// A class representing a photo with its details.
final class Photo {
  /// The unique identifier for the photo.
  final int id;

  /// The URL of the photo.
  final String photo;

  /// The number of likes the photo has received.
  final int likeCount;

  /// The number of views the photo has received.
  final int views;

  const Photo({
    required this.id,
    required this.photo,
    required this.likeCount,
    required this.views,
  });
}
