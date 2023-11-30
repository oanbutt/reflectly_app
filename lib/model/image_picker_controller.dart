import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyImagePicker extends GetxController {

  RxString imagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadImagePath();
  }

  Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', path);
    imagePath.value = path;
  }

  Future<void> loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPath = prefs.getString('imagePath');
    if (savedPath != null) {
      imagePath.value = savedPath;
    }
  }

  Future getImagefromcamera () async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if(image != null) {
      imagePath.value = image.path.toString();
      await saveImagePath(imagePath.value);
    }
  }

  Future getImagefromgallery () async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null) {
      imagePath.value = image.path.toString();
      await saveImagePath(imagePath.value);
    }
  }
}