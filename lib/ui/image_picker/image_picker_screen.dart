import 'dart:io';

import 'package:bloc_practice/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter/material.dart';

import '../views.dart';

// ImagePickerScreen class which is a stateless widget to display the image picker UI.
class ImagePickerScreen extends StatelessWidget {
  // Constructor for ImagePickerScreen, accepting a key.
  const ImagePickerScreen({super.key});

  // Overriding the build method to define the UI of the ImagePickerScreen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with the title "Image Picker".
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      // SafeArea to ensure the UI is visible on devices with notches or insets.
      body: SafeArea(
        child: Center(
          // BlocBuilder to rebuild the UI based on the state of ImagePickerBloc.
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return Column(
                children: [
                  // Displaying the picked image if available.
                  state.file != null
                      ? SizedBox(
                          width: 500,
                          height: 500,
                          child: Image.file(File(state.file!.path.toString())))
                      : Container(),
                  const SizedBox(height: 20),
                  // Row to display buttons for camera, gallery, and removing image.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Button to capture an image from the camera.
                      InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(CameraImage());
                        },
                        child: const Column(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                            Text(
                              'Camera',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Button to pick an image from the gallery.
                      InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(GalleryImage());
                        },
                        child: const Column(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.photo_album_outlined),
                            ),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Button to remove the selected image.
                      InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(RemoveImage());
                        },
                        child: const Column(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.clear),
                            ),
                            Text(
                              'Remove',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
