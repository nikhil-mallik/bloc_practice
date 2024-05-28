import 'package:image_picker/image_picker.dart';

/// Utility class for handling image picking functionality.
class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();

  /// Method to capture an image from the device's camera.
  Future<XFile?> cameraCapture() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  /// Method to pick an image from the device's gallery.
  Future<XFile?> pickGalleryImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
