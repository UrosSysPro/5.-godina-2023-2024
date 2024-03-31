import 'package:http/http.dart' as http;
import 'dart:convert';

class Utils{
  static String api="https://api.deezer.com";

  static Future<ApiResponse> search({
    required SearchType type,
    required String query
  })async{
    return apiRequest('get','$api/search/${type.value}?q=$query');
  }
}
enum SearchType{
  track(value:"track");
  const SearchType({required this.value});
  final String value;
}
class ApiResponse{
  final int status;
  final String body;
  ApiResponse(this.status,this.body);
}
Future<ApiResponse> apiRequest(String type,String url,{Map<String,String>? headers,Object? body})async{
  try{
    switch(type){
      case 'get':{
        var response=await http.get(Uri.parse(url),headers: headers);
        return ApiResponse(response.statusCode, response.body);
      }
      case 'post':{
        var response=await http.post(Uri.parse(url),headers: headers,body: body);
        return ApiResponse(response.statusCode, response.body);
      }
      default:{
        print("[ERROR] unknown request type");
        return ApiResponse(500, jsonEncode({"message":"unknown response type"}));
      }
    }

  }catch(e){
    return ApiResponse(500, jsonEncode(e));
  }
}