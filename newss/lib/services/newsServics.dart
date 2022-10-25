import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/articlModal.dart';

class newsService {
  Future<List<Articles>> getNews(String st) async {
    String url =
        'https://newsapi.org/v2/everything?q=${st}&apiKey=5542017b3f844f97a216998904586a07';
    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      Map<String, dynamic> obj = jsonDecode(result.body);
      List<dynamic> bod = obj['articles'];
      List<Articles> art =
          bod.map((dynamic ite) => Articles.fromJson(ite)).toList();
      return art;
    } else {
      throw Exception('Error');
    }
  }
}
