import 'package:dartz/dartz.dart';
import 'package:suitmedia_intern/core/error/failures.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';
import 'package:suitmedia_intern/features/domain/repositories/palindrom_repositories.dart';

class GetUser {
  final PalindromRepository repository;
  GetUser(this.repository);

  Future<Either<Failure, User>> call(int id) async {
    return await repository.getUser(id);
  }
}
