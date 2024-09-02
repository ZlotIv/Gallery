import 'package:gallery_project/domain/get_photos_use_case.dart';
import 'package:get/get.dart';
import '../../../domain/model/photo.dart';

const int _queryDuration = 500;

final class PhotoController extends GetxController {
  final GetPhotosUseCase getUseCase;
  var photos = <Photo>[].obs;
  var query = "".obs;
  var page = 1;
  var isLoading = false.obs;

  PhotoController({required this.getUseCase});

  @override
  void onInit() {
    super.onInit();
    loadPhotos();
    debounce(query, (_) => loadPhotos(), time: const Duration(milliseconds: _queryDuration));
  }

  void loadPhotos() async {
    var photoResponses = await getUseCase.getPhotos(query.value, page);
    photos.addAll(photoResponses);
    isLoading.value = false;
  }

  void loadNextPage() {
    if (isLoading.value) return;
    isLoading.value = true;
    page++;
    loadPhotos();
  }

  void filterPhotos(String query) {
    page = 1;
    photos.clear();
    this.query.value = query;
  }
}
