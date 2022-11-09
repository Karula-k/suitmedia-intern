import 'package:suitmedia_intern/features/data/models/support_model.dart';
import 'package:suitmedia_intern/features/data/models/user_model.dart';
import 'package:suitmedia_intern/features/domain/entities/user_detail.dart';

class UserDetailModel extends UserDetail {
  const UserDetailModel({required super.data, required super.support});

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
        data: UserModel.fromJson(json['data']),
        support: SupportModel.fromJson(json['support']),
      );
}
