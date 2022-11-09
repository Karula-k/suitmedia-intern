import 'package:flutter_test/flutter_test.dart';
import 'package:suitmedia_intern/features/data/models/response_palindrom_model.dart';
import 'package:suitmedia_intern/features/domain/entities/response_palindrom.dart';

void main() {
  const tResponsePalindromModel =
      ResponsePalindromModel(returnText: "ini salah", hasil: true);

  test('should be subclass of ResponsePalindrom', () {
    //assert
    expect(tResponsePalindromModel, isA<ResponsePalindrom>());
  });
}
