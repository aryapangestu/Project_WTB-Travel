import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wtb_travel/models/place.dart';

Future<List<Place>> getPlaces() async {
  http.Response response;

  response =
      await http.get(Uri.parse("https://wtb-travel1.herokuapp.com/api/places"));

  if (response.statusCode != 200) {
    response = await http
        .get(Uri.parse("http://wtb-travel1.herokuapp.com/api/places"));
  }

  List body = jsonDecode(response.body);

  List<Place> finalList = [];
  var latTemp;
  var lngTemp;

  for (var place in body) {
    if (place["lat"] is String) {
      latTemp = double.parse(place["lat"]);
      lngTemp = double.parse(place["lng"]);
    } else {
      latTemp = place["lat"];
      lngTemp = place["lng"];
    }
    finalList.add(Place(
        id: place["id"],
        image: place["src"],
        name: place["name"],
        address: place["address"],
        description: place["description"],
        comments: place["comments"],
        lat: latTemp,
        lng: lngTemp,
        view: place["view"],
        rating: place["rating"]));
  }

  return finalList;
}

Future<List<Place>> searchPlaces(String name) async {
  http.Response response;

  response = await http
      .get(Uri.parse("http://wtb-travel1.herokuapp.com/api/search/$name"));

  if (response.statusCode != 200) {
    response = await http
        .get(Uri.parse("http://wtb-travel1.herokuapp.com/api/search/$name"));
  }

  List body = jsonDecode(response.body);

  List<Place> finalList = [];
  var latTemp;
  var lngTemp;

  for (var place in body) {
    if (place["lat"] is String) {
      latTemp = double.parse(place["lat"]);
      lngTemp = double.parse(place["lng"]);
    } else {
      latTemp = place["lat"];
      lngTemp = place["lng"];
    }
    finalList.add(Place(
        id: place["id"],
        image: place["src"],
        name: place["name"],
        address: place["address"],
        description: place["description"],
        comments: place["comments"],
        lat: latTemp,
        lng: lngTemp,
        view: place["view"],
        rating: place["rating"]));
  }
  return finalList;
}
