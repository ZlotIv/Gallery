import 'package:flutter/material.dart';
import 'package:gallery_project/domain/get_photos_use_case.dart';
import 'package:get/get.dart';
import '../../domain/model/photo.dart';
import '../../res/strings.dart';
import '../details/details_page.dart';
import 'controller/photo_controller.dart';

/// A page that displays a gallery of photos.
class GalleryPage extends StatelessWidget {
  /// Scroll controller for handling scroll events.
  final ScrollController _scrollController = ScrollController();

  /// Controller for managing photo gallery state and interactions.
  final PhotoController controller = Get.put(PhotoController(getUseCase: Get.find<GetPhotosUseCase>()));

  /// Text editing controller for handling search input.
  final TextEditingController _searchController = TextEditingController();

  GalleryPage({super.key});

  /// Builds the gallery page UI.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        bottom: false,
        child: Obx(() {
          if (controller.photos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          _scrollController.addListener(() {
            if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
              controller.loadNextPage();
            }
          });
          return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: _buildPhotoLayout());
        }),
      ),
    );
  }

  /// Builds the app bar with a search field.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(Strings.gallery),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: Strings.searchPhotos,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              controller.filterPhotos(value);
            },
          ),
        ),
      ),
    );
  }

  /// Builds the photo layout as a grid view.
  Widget _buildPhotoLayout() {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250),
      itemCount: controller.photos.length,
      itemBuilder: (BuildContext context, int index) {
        var currentPhoto = controller.photos[index];
        return _buildPhotoItem(currentPhoto);
      },
    );
  }

  /// Builds a single photo item in the grid.
  Widget _buildPhotoItem(Photo currentPhoto) {
    return InkWell(
      onTap: () => Get.toNamed(detailsPageName,
          arguments: <String, String>{heroPhotoTag: currentPhoto.photo, heroPhotoId: currentPhoto.id.toString()}),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: currentPhoto.id.toString(),
                child: Image.network(
                  currentPhoto.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye),
                    const SizedBox(width: 4.0),
                    Text(
                      currentPhoto.views.toString(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.favorite),
                    const SizedBox(width: 4.0),
                    Text(
                      currentPhoto.likeCount.toString(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
