import 'dart:convert';

import '../network/consts.dart';
import 'model/photo_response.dart';
import 'package:http/http.dart' as http;

const String _keyParam = "key";
const String _qParam = "q";
const String _page = "page";

abstract interface class PhotoApi {
  Future<PhotoResponse> getPhotos(String query, String page);
}

final class PhotoApiImpl implements PhotoApi {
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
      throw Exception("Failed to load photos");
    }
  }
}
