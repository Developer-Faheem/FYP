// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class SHttpHelper {
//   static const String _baseUrl = "https/hdhd/nsjdh";

//   //helper method to make the get request
//   static Future<Map<String, dynamic>> getRequest(String endpoint) async {
//     final response = await http.get(Uri.parse('_baseUrl/$endpoint'));
//     return _handleResponse(response);
//   }

//   //helper method to make the post request
//   static Future<Map<String, dynamic>> post(
//       String endpoint, dynamic data) async {
//     final response = await http.post(
//       Uri.parse('_baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

//   //helper method to make the put request
//   static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
//     final response = await http.put(
//       Uri.parse('_baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

//   //helper method to make the delete request
//   static Future<Map<String, dynamic>> delete(String endpoint) async {
//     final response = await http.delete(Uri.parse('_baseUrl/$endpoint'));
//     return _handleResponse(response);
//   }

//   static Map<String, dynamic> _handleResponse(http.Response response) {
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load Data: ${response.statusCode}');
//     }
//   }
// }
