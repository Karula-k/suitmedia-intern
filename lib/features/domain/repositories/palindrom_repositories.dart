import 'package:dartz/dartz.dart';
import 'package:suitmedia_intern/core/error/failures.dart';
import 'package:suitmedia_intern/features/domain/entities/list_user.dart';
import 'package:suitmedia_intern/features/domain/entities/response_palindrom.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';

abstract class PalindromRepository {
  Future<Either<Failure, ResponsePalindrom>> checkPalindrom(String words);
  Future<Either<Failure, ListUser>> getListUser();
  Future<Either<Failure, User>> getUser(int id);
}
