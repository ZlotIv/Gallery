import 'package:gallery_project/domain/get_photos_use_case.dart';
import 'package:get/get.dart';
import '../../../domain/model/photo.dart';

/// Duration for debouncing search queries.
const int _queryDuration = 500;

/// Controller for managing photo gallery state and interactions.
final class PhotoController extends GetxController {
  /// Use case for fetching photos.
  final GetPhotosUseCase getUseCase;

  /// Observable list of photos.
  var photos = <Photo>[].obs;

  /// Observable search query.
  var query = "".obs;

  /// Current page number.
  var page = 1;

  /// Observable loading state.
  var isLoading = false.obs;

  PhotoController({required this.getUseCase});

  /// Initializes the controller, loads initial photos, and sets up query debounce.
  @override
  void onInit() {
    super.onInit();
    loadPhotos();
    debounce(query, (_) => loadPhotos(), time: const Duration(milliseconds: _queryDuration));
  }

  /// Loads photos based on the current query and page.
  void loadPhotos() async {
    var photoResponses = await getUseCase.getPhotos(query.value, page);
    photos.addAll(photoResponses);
    isLoading.value = false;
  }

  /// Loads the next page of photos.
  void loadNextPage() {
    if (isLoading.value) return;
    isLoading.value = true;
    page++;
    loadPhotos();
  }

  /// Filters photos based on the provided [query].
  void filterPhotos(String query) {
    page = 1;
    photos.clear();
    this.query.value = query;
  }
}
