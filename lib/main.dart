import 'package:flutter/material.dart';
import 'package:gallery_project/data/photo_api.dart';
import 'package:gallery_project/data/photo_repo.dart';
import 'package:gallery_project/domain/get_photos_use_case.dart';
import 'package:gallery_project/page/details/details_page.dart';
import 'package:gallery_project/page/gallery/controller/photo_controller.dart';
import 'package:get/get.dart';

import 'page/gallery/gallery_page.dart';

void main() {
  Get.put<PhotoApi>(PhotoApiImpl());
  Get.put<PhotoRepo>(PhotoRepoImpl(api: Get.find<PhotoApi>()));
  Get.put<GetPhotosUseCase>(GetPhotosUseCaseImpl(repository: Get.find<PhotoRepo>()));
  Get.put<PhotoController>(PhotoController(getUseCase: Get.find<GetPhotosUseCase>()));

  runApp(GetMaterialApp(
    initialRoute: "/",
    home: GalleryPage(),
    getPages: [
      GetPage(name: "/", page: () => GalleryPage()),
      GetPage(name: "/$detailsPageName", page: () => const DetailsPage())
    ],
  ));
}
