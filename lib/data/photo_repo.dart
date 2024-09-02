import 'dart:math';

import 'package:gallery_project/data/photo_api.dart';

import 'model/hit_response.dart';

/// An abstract interface for photo repository.
abstract interface class PhotoRepo {
  /// Fetches photos based on the provided [query] and [page].
  ///
  /// Returns a list of [HitResponse] containing the photos.
  Future<List<HitResponse>> fetchPhotos(String query, int page);
}

/// Implementation of the [PhotoRepo] interface.
final class PhotoRepoImpl implements PhotoRepo {
  /// API for fetching photos.
  final PhotoApi api;

  PhotoRepoImpl({required this.api});

  /// Fetches photos based on the provided [query] and [page].
  ///
  /// Returns a list of [HitResponse] containing the photos.
  @override
  Future<List<HitResponse>> fetchPhotos(String query, int page) async {
    var response = await api.getPhotos(query, page.toString());
    return response.hits;
  }
}
