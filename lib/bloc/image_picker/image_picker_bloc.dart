import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utlis.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

/// ImagePickerBloc class which extends Bloc to handle ImagePickerEvent and ImagePickerState.
class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  /// Utility class to handle image picking functionality.
  final ImagePickerUtils imagePickerUtils;

  /// Constructor for ImagePickerBloc, initializing with the image picker utility.
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    // Registering the event handlers.
    on<CameraImage>(_captureImage);
    on<GalleryImage>(_galleryImage);
    on<RemoveImage>(_removeImage);
  }

  /// Handler for capturing an image from the camera.
  void _captureImage(
      CameraImage event, Emitter<ImagePickerState> states) async {
    // Capture an image using the camera.
    final XFile? file = await imagePickerUtils.cameraCapture();
    // Emit the new state with the captured image file.
    states(state.copyWith(file: file));
  }

  /// Handler for picking an image from the gallery.
  void _galleryImage(
      GalleryImage event, Emitter<ImagePickerState> states) async {
    // Pick an image from the gallery.
    final XFile? file = await imagePickerUtils.pickGalleryImage();
    // Emit the new state with the selected image file.
    states(state.copyWith(file: file));
  }

  /// Handler for removing the selected image.
  void _removeImage(RemoveImage event, Emitter<ImagePickerState> states) async {
    // Set the file to null to indicate no image.
    const XFile? file = null;
    // Emit the new state with the file set to null.
    states(state.copyWith(file: file));
  }
}
