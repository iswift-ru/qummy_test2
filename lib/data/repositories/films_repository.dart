import 'package:qummytest2/data/models/api_result_model.dart';
import 'package:http/http.dart' as http;
import 'package:qummytest2/res/string.dart';
import 'dart:convert';

abstract class FilmRepository {
  Future<List<Results>> getResults();
}

class FilmsRepositoryImpl implements FilmRepository {
  @override
  Future<List<Results>> getResults() async {
    var response = await http.get(AppString.apiFilmsUrl);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Results> results = ApiResultModel.fromJson(data).results;
      print(data);
      return results;
    } else {
      throw Exception();
    }
  }
}
