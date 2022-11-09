import 'package:equatable/equatable.dart';

class Support extends Equatable {
  const Support({
    required this.url,
    required this.text,
  });

  final String url;
  final String text;

  @override
  List<Object?> get props => [url, text];
}
