import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Digimon {
  final String name;
  String imageUrl;
  String apiname;
  String levelDigimon;

  int rating = 10;

  Digimon(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      apiname = name; //.toLowerCase();
      var uri = new Uri.https('www.mockachino.com', '/f7e91f31-237b-41/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      List data = json.decode("[" + responseBody + "]");
      imageUrl = data[0]["img"];
      levelDigimon = data[0]["origin"];

      print(levelDigimon);
    } catch (exception) {
      print(exception);
    }
  }
}
