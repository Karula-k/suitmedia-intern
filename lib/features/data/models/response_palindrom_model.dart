import 'package:suitmedia_intern/features/domain/entities/response_palindrom.dart';

class ResponsePalindromModel extends ResponsePalindrom {
  const ResponsePalindromModel(
      {required super.returnText, required super.hasil});

  factory ResponsePalindromModel.fromJson(Map<String, dynamic> json) =>
      ResponsePalindromModel(
          returnText: json['returnText'], hasil: json['hasil']);
}
