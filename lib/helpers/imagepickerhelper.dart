import 'package:get_paid/helpers/showsnackbar.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static String? userId;

  static var navigatorKey;

  static Future<XFile?> getImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();

    // picker.pickMultiImage();
    try {
      return await picker.pickImage(
        imageQuality: 35,
        source: imageSource,
      );

      // Otherwise open camera to get new photo
    } on Exception catch (e) {
      dp(msg: "Error in picking image", arg: e);
      return null;
    }
  }

  static Future<List<XFile>?> getMultipleImages(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    //List<XFile>? imageFileList = [];

    // picker.pickMultiImage();
    try {
      return await picker.pickMultiImage(imageQuality: 40);
      //  if (selectedImages!.isNotEmpty) {
      //     imageFileList.addAll(selectedImages);
      //  }
    } on Exception catch (e) {
      dp(msg: "Error in picking image", arg: e);
      return null;
    }
  }
}
