import 'package:gallery_project/domain/model/photo.dart';

import '../data/photo_repo.dart';

abstract interface class GetPhotosUseCase {
  Future<List<Photo>> getPhotos(String query, int page);
}

final class GetPhotosUseCaseImpl implements GetPhotosUseCase {
  final PhotoRepo repository;

  GetPhotosUseCaseImpl({required this.repository});

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
