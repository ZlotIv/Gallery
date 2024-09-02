import 'package:gallery_project/domain/model/photo.dart';

import '../data/photo_repo.dart';

/// An abstract interface for the use case of fetching photos.
abstract interface class GetPhotosUseCase {
  /// Fetches photos based on the provided [query] and [page].
  ///
  /// Returns a list of [Photo] objects.
  Future<List<Photo>> getPhotos(String query, int page);
}

/// Implementation of the [GetPhotosUseCase] interface.
final class GetPhotosUseCaseImpl implements GetPhotosUseCase {
  /// Repository for fetching photos.
  final PhotoRepo repository;

  GetPhotosUseCaseImpl({required this.repository});

  /// Fetches photos based on the provided [query] and [page].
  ///
  /// Maps the response to a list of [Photo] objects.
  @override
  Future<List<Photo>> getPhotos(String query, int page) async {
    var photoResponses = await repository.fetchPhotos(query, page);

    return photoResponses.map((response) =>
        Photo(
          id: response.id,
          photo: response.fullHDURL ?? response.largeImageURL ?? response.previewURL,
          likeCount: response.likes,
          views: response.views,
        )).toList();
  }
}
