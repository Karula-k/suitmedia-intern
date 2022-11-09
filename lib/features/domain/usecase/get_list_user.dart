import 'package:dartz/dartz.dart';
import 'package:suitmedia_intern/core/error/failures.dart';
import 'package:suitmedia_intern/features/domain/entities/list_user.dart';
import 'package:suitmedia_intern/features/domain/repositories/palindrom_repositories.dart';

class GetListUser {
  final PalindromRepository repository;
  GetListUser(this.repository);

  Future<Either<Failure, ListUser>> call(int page, int perPage) async {
    return await repository.getListUser(page, perPage);
  }
}
