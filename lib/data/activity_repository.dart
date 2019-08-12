import 'dart:convert';

import 'package:dayts/models/activity.dart';
import 'package:http/http.dart' as http;

class ActivityRepository {
  Future<Activity> getActivity() async {
    final response = await http.get('https://www.boredapi.com/api/activity');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Activity.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load activity');
    }
  }
}
