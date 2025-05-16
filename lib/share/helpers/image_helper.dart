import 'package:pragma_exam/config/constants/app_constants.dart';

class ImageHelper {
  static String getImageUrl(String imageId) {
    return '$kBucketUrl/$imageId.jpg';
  }
}
