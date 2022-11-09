import 'package:dartz/dartz.dart';
import 'package:suitmedia_intern/core/error/failures.dart';
import 'package:suitmedia_intern/features/domain/entities/response_palindrom.dart';
import 'package:suitmedia_intern/features/domain/repositories/palindrom_repositories.dart';

class CheckPalindrom {
  final PalindromRepository repository;
  CheckPalindrom(this.repository);

  Future<Either<Failure, ResponsePalindrom>> execute(String words) async {
    return await repository.checkPalindrom(words);
  }
}
