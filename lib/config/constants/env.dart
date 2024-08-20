import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String baseUrl = dotenv.env['BASE_URL'] ?? 'There is not BASE_URL';

  static String apiKey = dotenv.env['API_KEY'] ?? 'There is not API_KEY';
}
