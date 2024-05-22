import 'package:image_picker/image_picker.dart';

class ImagePickerUtlis {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickGalleryImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
