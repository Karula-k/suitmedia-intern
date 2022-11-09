import 'package:equatable/equatable.dart';

class ResponsePalindrom extends Equatable {
  final String returnText;
  final bool hasil;

  const ResponsePalindrom({
    required this.returnText,
    required this.hasil,
  });
  @override
  List<Object?> get props => [returnText, hasil];
}
