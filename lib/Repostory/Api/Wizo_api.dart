import 'dart:convert';
import 'package:http/http.dart';
import '../Model Class/WizoModel.dart';
import 'api_client.dart';

class WizoApi {
  ApiClient apiClient = ApiClient();

  Future<WizoModel> getWizo() async {
    String trendingpath =
        'https://real-time-amazon-data.p.rapidapi.com/search?query=Phone&page=1&country=US&sort_by=RELEVANCE&product_condition=ALL';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return WizoModel.fromJson(jsonDecode(response.body));
  }
}
