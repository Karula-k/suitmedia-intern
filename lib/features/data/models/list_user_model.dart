import 'package:suitmedia_intern/features/data/models/support_model.dart';
import 'package:suitmedia_intern/features/data/models/user_model.dart';
import 'package:suitmedia_intern/features/domain/entities/list_user.dart';

class ListUserModel extends ListUser {
  const ListUserModel(
      {required super.page,
      required super.perPage,
      required super.total,
      required super.totalPages,
      required super.data,
      required super.support});
  factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
        page: json['page'],
        perPage: json['total_pages'],
        total: json['total'],
        totalPages: json['total_pages'],
        data: List<UserModel>.from(
          json['data'].map((x) => UserModel.fromJson(x)),
        ),
        support: SupportModel.fromJson(json['support']),
      );
}
