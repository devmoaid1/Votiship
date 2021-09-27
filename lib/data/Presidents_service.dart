import 'dart:convert';
import 'Rest_service.dart';
import 'models/president.dart';

class PresidentDataService {
  static final PresidentDataService _instance =
      PresidentDataService._constructor();
  factory PresidentDataService() {
    return _instance;
  }

  PresidentDataService._constructor();
  final rest = RestService();

  Future<List<President>> getAllPresidents() async {
    final listJson = await rest.get('quotes');

    return (listJson as List)
        .map((itemJson) => President.fromJson(itemJson))
        .toList();
  }

  Future deletePresident({String id}) async {
    await rest.delete('presidents/$id');
  }

  Future<President> addPresident({President president}) async {
    final json = await rest.post('presidents', data: president);
    return President.fromJson(json);
  }

  Future<President> getPresident({String id}) async {
    final quote = await rest.get('presidents/$id');
    return json.decode(quote);
  }

  Future<President> votePresident({String id, int vote}) async {
    final quote = await rest.patch('presidents/$id', data: {'votes': vote});
    return President.fromJson(quote);
  }
}
