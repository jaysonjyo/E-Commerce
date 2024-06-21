import 'dart:convert';
import 'package:http/http.dart';
import '../Model Class/WizoModelSecond.dart';
import '../Model Class/WizoReview.dart';
import 'api_client.dart';


class WizoreviewApi {
  ApiClient apiClient = ApiClient();
  Future<WizoReviewModel> getwizoReview(String id) async {
    String trendingpath = 'https://real-time-amazon-data.p.rapidapi.com/product-reviews?asin=$id&country=US&sort_by=TOP_REVIEWS&star_rating=ALL&verified_purc';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return WizoReviewModel.fromJson(jsonDecode(response.body));
  }
}