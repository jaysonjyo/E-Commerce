import 'dart:convert';
import 'package:http/http.dart';
import '../Model Class/WizoModelSecond.dart';
import 'api_client.dart';


class WizosecondApi {
  ApiClient apiClient = ApiClient();


  Future<WizoModelSecond> getWizosecond(String id) async {
    String trendingpath = 'https://real-time-amazon-data.p.rapidapi.com/product-details?asin=$id&country=US';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return WizoModelSecond.fromJson(jsonDecode(response.body));
  }
}