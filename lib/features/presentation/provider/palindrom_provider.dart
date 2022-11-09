import 'package:flutter/material.dart';
import 'package:suitmedia_intern/core/enum/state_enum.dart';
import 'package:suitmedia_intern/features/domain/entities/response_palindrom.dart';
import 'package:suitmedia_intern/features/domain/usecase/check_palindrom.dart';

class PalindromProvider extends ChangeNotifier {
  late ResponsePalindrom _result;
  ResponsePalindrom get result => _result;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;
  String _massage = "";
  String get massage => _massage;
  final CheckPalindrom checkPalindrom;
  PalindromProvider({required this.checkPalindrom});

  Future<void> fetchPalindrom(String words) async {
    _state = RequestState.Loading;
    notifyListeners();
    final output = await checkPalindrom(words);
    output.fold((failure) {
      _state = RequestState.Error;
      _massage = failure.message;
      notifyListeners();
    }, (resposnse) {
      _state = RequestState.Loaded;
      _result = resposnse;
      notifyListeners();
    });
  }
}
