import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking {
  Networking(this.url);
  final String url;

  Future getData() async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return response.statusCode.toString();
    }
  }
}
