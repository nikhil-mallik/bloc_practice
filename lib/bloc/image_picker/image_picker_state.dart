part of 'image_picker_bloc.dart';

/// ImagePickerState class that extends Equatable to ensure value equality.
class ImagePickerState extends Equatable {
  /// File representing the picked image.
  final XFile? file;

  /// Constructor for ImagePickerState with an optional file parameter.
  const ImagePickerState({this.file});

  /// Method to create a copy of the current state with an updated file.
  ImagePickerState copyWith({XFile? file}) {
    return ImagePickerState(file: file);
  }

  /// Overriding props method to include file for value comparison.
  @override
  List<Object?> get props => [file];
}
