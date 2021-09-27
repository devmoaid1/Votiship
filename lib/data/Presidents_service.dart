import 'dart:convert';
import 'Rest_service.dart';
import 'models/president.dart';

class QuoteDataService {
  static final QuoteDataService _instance = QuoteDataService._constructor();
  factory QuoteDataService() {
    return _instance;
  }

  QuoteDataService._constructor();
  final rest = RestService();

  Future<List<President>> getAllQuotes() async {
    final listJson = await rest.get('quotes');

    return (listJson as List)
        .map((itemJson) => President.fromJson(itemJson))
        .toList();
  }

  Future deleteQuote({String id}) async {
    await rest.delete('presidents/$id');
  }

  Future<President> createQuote({President president}) async {
    final json = await rest.post('presidents', data: president);
    return President.fromJson(json);
  }

  Future<President> getQuote({String id}) async {
    final quote = await rest.get('presidents/$id');
    return json.decode(quote);
  }

  Future<President> updateLike({String id, int vote}) async {
    final quote = await rest.patch('presidents/$id', data: {'votes': vote});
    return President.fromJson(quote);
  }
}
