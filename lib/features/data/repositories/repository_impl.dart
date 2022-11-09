import 'package:suitmedia_intern/features/data/datasources/remote_data_sources.dart';
import 'package:suitmedia_intern/features/data/helper/helper_palindrom.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';
import 'package:suitmedia_intern/features/domain/entities/response_palindrom.dart';
import 'package:suitmedia_intern/features/domain/entities/list_user.dart';
import 'package:suitmedia_intern/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:suitmedia_intern/features/domain/repositories/palindrom_repositories.dart';

class RepostioryIMPL implements PalindromRepository {
  final PalindromFunction palindrom;
  final RemoteDataSource remoteDataSource;

  RepostioryIMPL({required this.palindrom, required this.remoteDataSource});

  @override
  Future<Either<Failure, ResponsePalindrom>> checkPalindrom(
      String words) async {
    try {
      return Right(await palindrom(words));
    } on Exception {
      return const Left(ExceptionFailure(
          "Something wrong, try close and reopen the app again"));
    }
  }

  @override
  Future<Either<Failure, ListUser>> getListUser(int page, int perPage) async {
    try {
      return Right(await remoteDataSource.getListUserRemote(page, perPage));
    } on Exception {
      return const Left(ExceptionFailure(
          "Something wrong, try close and reopen the app again"));
    }
  }

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      return Right(await remoteDataSource.getUser(id));
    } on Exception {
      return const Left(ExceptionFailure(
          "Something wrong, try close and reopen the app again"));
    }
  }
}
