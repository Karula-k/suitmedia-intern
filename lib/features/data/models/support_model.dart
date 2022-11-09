import 'package:suitmedia_intern/features/domain/entities/support.dart';

class SupportModel extends Support {
  const SupportModel({required super.url, required super.text});

  factory SupportModel.fromJson(Map<String, dynamic> json) =>
      SupportModel(url: json['url'], text: json['text']);
}
