part of 'image_picker_bloc.dart';

// Abstract class ImagePickerEvent that extends Equatable to ensure value equality.
abstract class ImagePickerEvent extends Equatable {
  // Constructor for ImagePickerEvent.
  const ImagePickerEvent();

  // Overriding props method to return an empty list for value comparison.
  @override
  List<Object> get props => [];
}

// Event class for capturing an image from the camera.
class CameraImage extends ImagePickerEvent {}

// Event class for picking an image from the gallery.
class GalleryImage extends ImagePickerEvent {}

// Event class for removing the selected image.
class RemoveImage extends ImagePickerEvent {}
