import 'dart:convert';

import 'package:MyFlutterTest/src/http/http_client.dart';
import 'package:MyFlutterTest/src/models/Answer.dart';
import 'package:http/http.dart';

class StackAnswersService {
  final Client client = HttpClient.getClient();

  Future<List<Answer>> getAnswers(int page, int pageSize) async {
    var url =
        "https://api.stackexchange.com/2.2/answers?page=$page&pagesize=$pageSize";
    print(url);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body)["items"];
      return List<Map>.from(json).map((e) => Answer.fromJson(e)).toList();
    }
    return [];
  }
}
