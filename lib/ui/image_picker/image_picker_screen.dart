import 'dart:io';

import 'package:bloc_practice/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return Column(
                children: [
                  state.file != null
                      ? SizedBox(
                          width: 500,
                          height: 500,
                          child: Image.file(File(state.file!.path.toString())))
                      : Container(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
