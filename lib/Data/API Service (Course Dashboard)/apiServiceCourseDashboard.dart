import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseDashboardAPIService {
  static const String URL = 'https://bcc.touchandsolve.com/api';
  late final String authToken;

  CourseDashboardAPIService._();

  static Future<CourseDashboardAPIService> create() async {
    var apiService = CourseDashboardAPIService._();
    await apiService._loadAuthToken();
    print('triggered API');
    return apiService;
  }

/*  CourseDashboardAPIService() {
    _loadAuthToken();
    print('triggered');
  }*/

  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token') ?? '';
    print('Load Token');
    print(prefs.getString('token'));
  }


  Future<Map<String, dynamic>> Courses({required String type}) async {
    final String url = '$URL/bkiict/dashboard/$type';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    final Map<String, dynamic> body = {
      "type": type,
    };

    print(body);

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
