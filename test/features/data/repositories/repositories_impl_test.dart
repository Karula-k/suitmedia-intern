import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:suitmedia_intern/core/error/failures.dart';
import 'package:suitmedia_intern/features/data/models/list_user_model.dart';
import 'package:suitmedia_intern/features/data/models/response_palindrom_model.dart';
import 'package:suitmedia_intern/features/data/repositories/repository_impl.dart';
import 'package:suitmedia_intern/features/domain/entities/support.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockPalindromFunction palindromFunction;
  late MockRemoteDataSource remoteDataSource;
  late RepostioryIMPL repostioryIMPL;

  setUp(() {
    palindromFunction = MockPalindromFunction();
    remoteDataSource = MockRemoteDataSource();
    repostioryIMPL = RepostioryIMPL(
        palindrom: palindromFunction, remoteDataSource: remoteDataSource);
  });
  const tPalindromResponse =
      ResponsePalindromModel(returnText: "hasil", hasil: true);
  const tListUser = ListUserModel(
      page: 1,
      perPage: 8,
      total: 0,
      totalPages: 0,
      data: [],
      support: Support(url: '', text: ''));
  const text = "final";
  group('Check Palindrom', () {
    test('should return ResponsePalindrom when function succesfull', () async {
      //arrange
      when(palindromFunction(text))
          .thenAnswer((realInvocation) async => tPalindromResponse);
      //act
      final result = await repostioryIMPL.checkPalindrom(text);
      //assert
      verify(palindromFunction(text));
      expect(result, const Right(tPalindromResponse));
    });
    test('should return Exception Failure when process failure', () async {
      //arrange
      when(palindromFunction(text)).thenThrow(Exception());
      //act
      final result = await repostioryIMPL.checkPalindrom(text);
      //assert
      verify(palindromFunction(text));
      expect(
          result,
          equals(const Left(ExceptionFailure(
              'Something wrong, try close and reopen the app again'))));
    });
  });

  group('Check List User', () {
    test('should return ListUser when function succesfull', () async {
      //arrange
      when(remoteDataSource.getListUserRemote(1, 8))
          .thenAnswer((realInvocation) async => tListUser);
      //act
      final result = await repostioryIMPL.getListUser(1, 8);
      //assert
      verify(remoteDataSource.getListUserRemote(1, 8));
      expect(result, const Right(tListUser));
    });
    test('should return Exception Failure when process failure', () async {
      //arrange
      when(remoteDataSource.getListUserRemote(1, 8)).thenThrow(Exception());
      //act
      final result = await repostioryIMPL.getListUser(1, 8);
      //assert
      verify(remoteDataSource.getListUserRemote(1, 8));
      expect(
          result,
          equals(const Left(ExceptionFailure(
              'Something wrong, try close and reopen the app again'))));
    });
  });
}
