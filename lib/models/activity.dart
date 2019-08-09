class Activity {
  final String description;

  Activity({this.description});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(description: json['activity']);
  }
}
