import 'package:equatable/equatable.dart';
import 'package:suitmedia_intern/features/domain/entities/support.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';

class ListUser extends Equatable {
  const ListUser({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;
  final Support support;

  @override
  List<Object?> get props => [page, perPage, total, totalPages, data, support];
}
