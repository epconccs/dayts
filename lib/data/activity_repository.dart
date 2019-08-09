class ActivityRepository {
  Future<String> getActivity() async {
    await Future.delayed(Duration(seconds: 2));
    return "Hola Mundo";
  }
}
