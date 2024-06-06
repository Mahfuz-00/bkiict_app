import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailsAPIService {
  static const String URL = 'https://bcc.touchandsolve.com/api';
  late final String authToken;

  CourseDetailsAPIService._();

  static Future<CourseDetailsAPIService> create() async {
    var apiService = CourseDetailsAPIService._();
    await apiService._loadAuthToken();
    print('triggered API');
    return apiService;
  }

/*  CourseDetailsAPIService() {
    _loadAuthToken();
    print('triggered');
  }*/

  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token') ?? '';
    print('Load Token');
    print(prefs.getString('token'));
  }


  Future<Map<String, dynamic>> CourseDetail({required int Id, required int BatchId}) async {
    final String url = '$URL/bkiict/courseinfo/$Id/$BatchId';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
        //body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Course Fetch successfully');
        final jsonData = json.decode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        // Request failed
        print('Failed to fetch course. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch course.');
      }
    } catch (e) {
      // Error occurred
      print('Error fetching course: $e');
      throw Exception('Error fetching courses: $e');
    }
  }
}
