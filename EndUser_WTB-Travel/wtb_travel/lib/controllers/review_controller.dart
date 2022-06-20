import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wtb_travel/models/review.dart';

Future<List<Review>> getReviews() async {
  http.Response response;

  response =
      await http.get(Uri.parse("http://wtb-travel1.herokuapp.com/api/reviews"));

  if (response.statusCode != 200) {
    response = await http
        .get(Uri.parse("http://wtb-travel1.herokuapp.com/api/reviews"));
  }

  List body = jsonDecode(response.body);

  List<Review> finalList = [];

  for (var review in body) {
    var temp;

    if (review["rating"] is int) {
      temp = review["rating"].toString();
    } else {
      temp = review["rating"];
    }
    finalList.add(Review(
        username: review["user_name"],
        subtitle: review["comment"],
        rating: temp));
  }

  return finalList;
}
