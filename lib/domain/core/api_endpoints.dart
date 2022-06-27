import 'package:netflix_app/Infrastructure/api_key.dart';
import 'package:netflix_app/core/url.dart';

class ApiEndPoints {
  static const downloads = "$baseUrl/trending/all/day?api_key=$apiKey";
}
