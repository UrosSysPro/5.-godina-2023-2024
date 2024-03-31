import 'package:http/http.dart' as http;

class Utils{
  static String api="https://api.deezer.com";

  static String? search({
    required String type,required String query}){
    http.get(Uri.parse('$api/search/$type?q=$query'));
  }
}
enum SearchType{
  track(value:"track");
  const SearchType({required this.value});
  final String value;
}