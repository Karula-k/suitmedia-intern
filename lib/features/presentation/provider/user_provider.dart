import 'package:flutter/cupertino.dart';
import 'package:suitmedia_intern/core/enum/state_enum.dart';
import 'package:suitmedia_intern/features/domain/entities/user.dart';
import 'package:suitmedia_intern/features/domain/usecase/get_list_user.dart';
import 'package:suitmedia_intern/features/domain/usecase/get_user.dart';

class UserProvider extends ChangeNotifier {
  final GetUser getUserDetail;
  final GetListUser getListUser;

  UserProvider({required this.getUserDetail, required this.getListUser});

  RequestState _statusUserList = RequestState.Empty;
  RequestState get statusUserList => _statusUserList;

  RequestState _statusUserDetail = RequestState.Empty;
  RequestState get statusGuestDetail => _statusUserDetail;

  late List<User> _listUser;
  List<User> get listUser => _listUser;

  late User _userDetail;
  User get userDetail => _userDetail;

  String _massage = '';
  String get massage => _massage;

  void update() {
    fetchListUser();
  }

  void nextPage(int number) {
    fetchUpdate(number);
  }

  Future<void> fetchListUser() async {
    _statusUserList = RequestState.Loading;
    notifyListeners();
    final result = await getListUser(1, 8);
    result.fold((failure) {
      _statusUserList = RequestState.Error;
      _massage = failure.message;
      notifyListeners();
    }, (guestListuser) {
      _statusUserList = RequestState.Loaded;
      _listUser = guestListuser.data;
      notifyListeners();
    });
  }

  Future<void> fetchUpdate(int number) async {
    _statusUserList = RequestState.Loading;
    notifyListeners();
    final result = await getListUser(2 + number, 8);
    result.fold((failure) {
      _statusUserList = RequestState.Error;
      _massage = failure.message;
      notifyListeners();
    }, (guestListuser) {
      if (guestListuser.data.isNotEmpty) {
        _statusUserList = RequestState.Loaded;
        notifyListeners();
        _listUser.addAll(guestListuser.data);
      } else {
        _statusUserList = RequestState.EndCheck;
        notifyListeners();
      }
    });
  }

  Future<void> fetchUserDetail(int id) async {
    try {
      _statusUserDetail = RequestState.Loading;
      notifyListeners();
      final result = await getUserDetail(id);
      result.fold((failure) {
        _statusUserDetail = RequestState.Error;
        _massage = failure.message;
        notifyListeners();
      }, (userDetails) {
        _statusUserDetail = RequestState.Loaded;
        _userDetail = userDetails;
        notifyListeners();
      });
    } catch (e) {
      _statusUserDetail = RequestState.Empty;
      _massage = e.toString();
      notifyListeners();
    }
  }
}
