import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class APICalls {
  Future<Response> getApiCall(String endpoints) async {
    final url = Uri.parse(endpoints);

    final response = await http.get(url);
    return response;
  }
}
