import 'package:suitmedia_intern/features/data/models/response_palindrom_model.dart';

class PalindromFunction {
  Future<ResponsePalindromModel> call(String text) async {
    text = text.toLowerCase();
    text = text.replaceAll(' ', '');
    if (text.length <= 1) {
      return const ResponsePalindromModel(
          returnText: "Is Palindrom", hasil: true);
    } else if (text[0] == text[text.length - 1]) {
      return await call(text.substring(1, text.length - 1));
    } else {
      return const ResponsePalindromModel(
          returnText: "Not Palindrom", hasil: false);
    }
  }
}
