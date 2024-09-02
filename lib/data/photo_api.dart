import 'dart:convert';

import 'package:gallery_project/res/strings.dart';

import '../network/consts.dart';
import 'model/photo_response.dart';
import 'package:http/http.dart' as http;

const String _keyParam = "key";
const String _qParam = "q";
const String _page = "page";

/// An abstract interface for fetching photos.
abstract interface class PhotoApi {
  /// Fetches photos based on the provided [query] and [page].
  ///
  /// Returns a [PhotoResponse] containing the photos.
  Future<PhotoResponse> getPhotos(String query, String page);
}

/// Implementation of the [PhotoApi] interface.
final class PhotoApiImpl implements PhotoApi {
  /// Fetches photos based on the provided [query] and [page].
  ///
  /// Constructs the request URL using the query parameters and sends a GET request.
  /// If the response status code is between 200 and 299, it returns a [PhotoResponse].
  /// Otherwise, it throws an exception.
  @override
  Future<PhotoResponse> getPhotos(String query, String page) async {
    var params = {_keyParam: NetworkConstants.apiKey, _page: page.toString()};

    if (query.isNotEmpty) {
      params[_qParam] = query;
    }
    var url = Uri.https(NetworkConstants.baseUrl, NetworkConstants.api, params);

    var response = await http.get(url);

    if (response.statusCode > 199 && response.statusCode < 300) {
      return PhotoResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(Strings.failedToLoadPhotos);
    }
  }
}
