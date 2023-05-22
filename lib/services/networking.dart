import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelp {
  NetworkHelp(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      return jsonData;
    } else {
      print(response.statusCode);
    }
  }
}
