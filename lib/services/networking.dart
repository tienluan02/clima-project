import 'dart:convert';
import 'package:http/http.dart';



class Networking {
  Networking(this.url);

  final String url;

  Future getData() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      var takeData = jsonDecode(data);

      return takeData;
    } else {
      print(response.statusCode);
    }
  }
}
