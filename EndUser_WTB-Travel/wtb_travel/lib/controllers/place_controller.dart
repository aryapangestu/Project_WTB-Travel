import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wtb_travel/models/place.dart';

Future<List<Place>> getPlaces() async {
  var response = await http.get(Uri.parse("http://10.0.2.2:8000/api/places"));

  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  }

  List body = jsonDecode(response.body);

  List<Place> finalList = [];

  for (var place in body) {
    finalList.add(Place(
        image: place["src"],
        name: place["name"],
        address: place["address"],
        description: place["description"],
        comments: place["comments"],
        lat: place["lat"],
        lng: place["lng"],
        view: place["view"]));
  }

  return finalList;
}
