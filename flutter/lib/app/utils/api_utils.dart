import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static String REQUEST_CHAMPIONS_URL = "http://${dotenv.env['IP_ADDRESS'] ?? ''}:8080/champions";
}
