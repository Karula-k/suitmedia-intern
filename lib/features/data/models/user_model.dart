import 'package:suitmedia_intern/features/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.avatar});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar']);
}
