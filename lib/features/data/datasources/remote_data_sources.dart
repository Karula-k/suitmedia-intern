import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_intern/core/error/exception.dart';
import 'package:suitmedia_intern/features/data/models/list_user_model.dart';
import 'package:suitmedia_intern/features/data/models/user_detail_model.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';

abstract class RemoteDataSource {
  Future<ListUserModel> getListUserRemote(int page, int perPage);
  Future<User> getUser(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  // ignore: constant_identifier_names
  static const BASE_URL = 'https://reqres.in/api';
  final http.Client client;

  RemoteDataSourceImpl({required this.client});
  @override
  Future<ListUserModel> getListUserRemote(int page, int perPage) async {
    final queryparam = {
      'page': page.toString(),
      'per_page': perPage.toString()
    };

    String uri = Uri(queryParameters: queryparam).query;
    final response = await client.get(Uri.parse('$BASE_URL/users?$uri'));

    if (response.statusCode == 200) {
      return ListUserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<User> getUser(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/users/$id'));

    if (response.statusCode == 200) {
      return UserDetailModel.fromJson(json.decode(response.body)).data;
    } else {
      throw ServerException();
    }
  }
}
