import 'package:flutter_test/flutter_test.dart';
import 'package:suitmedia_intern/features/data/helper/helper_palindrom.dart';
import 'package:suitmedia_intern/features/data/models/response_palindrom_model.dart';

void main() {
  const String textTest1 = "RADAR";
  const String textTest2 = "E";
  const String textTest3 = "No Lemon no melon";
  const String textTest4 = "soap";
  const String textTest5 = "gulaug";
  const String textTest6 = "E e";
  const trueResponse =
      ResponsePalindromModel(returnText: "Is Palindrom", hasil: true);
  const falseResponse =
      ResponsePalindromModel(returnText: "Not Palindrom", hasil: false);

  late PalindromFunction palindrom;

  setUp(() {
    palindrom = PalindromFunction();
  });
  group('usecase ', () {
    test('should return true to palindrom uppercase ', () async {
      //act
      final result = await palindrom(textTest1);
      //assert
      expect(result, trueResponse);
    });
    test('should return true to one letter ', () async {
      //act
      final result = await palindrom(textTest2);
      //assert
      expect(result, trueResponse);
    });
    test('should return true to mix case palindrom words', () async {
      //act
      final result = await palindrom(textTest3);
      //assert
      expect(result, trueResponse);
    });
    test('should return false to non palindrom', () async {
      //act
      final result = await palindrom(textTest4);
      //assert
      expect(result, falseResponse);
    });
    test(
        'should return false to non palindrom with 2 first and last similar letter ',
        () async {
      //act
      final result = await palindrom(textTest5);
      //assert
      expect(result, falseResponse);
    });
    test('should return true palindrom with different case', () async {
      //act
      final result = await palindrom(textTest6);
      //assert
      expect(result, trueResponse);
    });
  });
}
