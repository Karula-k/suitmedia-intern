import 'package:equatable/equatable.dart';
import 'package:suitmedia_intern/features/domain/entities/support.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';

class UserDetail extends Equatable {
  const UserDetail({
    required this.data,
    required this.support,
  });
  final User data;
  final Support support;

  @override
  List<Object?> get props => [data, support];
}
