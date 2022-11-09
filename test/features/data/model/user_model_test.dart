import 'dart:convert';
import 'package:suitmedia_intern/features/data/models/user_detail_model.dart';
import 'package:suitmedia_intern/features/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper/json_reader.dart';

void main() {
  const model = UserModel(
      id: 1,
      email: "george.bluth@reqres.in",
      firstName: "George",
      lastName: "Bluth",
      avatar: "https://reqres.in/img/faces/1-image.jpg");

  test('should return model after read json', () {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('dummy_data/user.json'));
    //act
    final result = UserDetailModel.fromJson(jsonMap).data;
    //assert
    expect(result, model);
  });
}
