import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wtb_travel/models/review.dart';

Future<List<Review>> getReviews(int id) async {
  http.Response response;

  response = await http
      .get(Uri.parse("http://wtb-travel1.herokuapp.com/api/reviews/$id"));

  if (response.statusCode != 200) {
    response = await http
        .get(Uri.parse("http://wtb-travel1.herokuapp.com/api/reviews/$id"));
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

storeReviews(String token, double rating, String comment, int user_id,
    int place_id) async {
  http.Response response;
  response = await http.post(
    Uri.parse('https://wtb-travel1.herokuapp.com/api/reviews'),
    headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'user_id': user_id,
      'place_id': place_id,
      'rating': rating,
      'comment': comment,
    }),
  );

  if (response.statusCode != 200 &&
      response.statusCode != 422 &&
      response.statusCode != 500) {
    response = await http.post(
      Uri.parse('https://wtb-travel1.herokuapp.com/api/reviews'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'user_id': user_id,
        'place_id': place_id,
        'rating': rating,
        'comment': comment,
      }),
    );
  }

  Map<String, dynamic> body = jsonDecode(response.body);
  if (response.statusCode == 422 || response.statusCode == 500) {
    return [body['success'], body['message']];
  }

  return [body['success']];
}
