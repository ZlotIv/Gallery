import 'dart:math';

import 'package:gallery_project/data/photo_api.dart';

import 'model/hit_response.dart';

abstract interface class PhotoRepo {
  Future<List<HitResponse>> fetchPhotos(String query, int page);
}

final class PhotoRepoImpl implements PhotoRepo {
  PhotoApi api;

  PhotoRepoImpl({required this.api});

  @override
  Future<List<HitResponse>> fetchPhotos(String query, int page) async {
    var response = await api.getPhotos(query, page.toString());

    return response.hits;
  }
}
