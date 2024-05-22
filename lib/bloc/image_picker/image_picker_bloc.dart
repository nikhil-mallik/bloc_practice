import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utlis.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtlis imagePickerUtlis;

  ImagePickerBloc(this.imagePickerUtlis) : super(const ImagePickerState()) {
    on<CameraImage>(_captureImage);
    on<GalleryImage>(_galleryImage);
    on<RemoveImage>(_removeImage);
  }

  void _captureImage(
      CameraImage event, Emitter<ImagePickerState> states) async {
    final XFile? file = await imagePickerUtlis.cameraCapture();
    states(state.copyWith(file: file));
  }

  void _galleryImage(
      GalleryImage event, Emitter<ImagePickerState> states) async {
    final XFile? file = await imagePickerUtlis.pickGalleryImage();
    states(state.copyWith(file: file));
  }
  void _removeImage(RemoveImage event, Emitter<ImagePickerState> states) async {
    const XFile? file = null;
    states(state.copyWith(file: file));
  }


}
