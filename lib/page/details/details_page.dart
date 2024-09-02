import 'package:flutter/material.dart';
import 'package:gallery_project/res/strings.dart';
import 'package:get/get.dart';

const String urlParam = "url";
const String heroPhotoTag = "photo_tag";
const String heroPhotoId = "photo_id";

const String detailsPageName = "details_page";

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = Get.arguments as Map<String, String>;
    final String photoUrl = args[heroPhotoTag]!;
    final String id = args[heroPhotoId]!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.details),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: id,
            child: Image.network(
              photoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
