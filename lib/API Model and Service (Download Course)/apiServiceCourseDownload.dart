import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseDownloadAPIService {
  final String baseUrl = 'https://bcc.touchandsolve.com/api';
  late final String authToken;

  CourseDownloadAPIService._();

  static Future<CourseDownloadAPIService> create() async {
    var apiService = CourseDownloadAPIService._();
    await apiService._loadAuthToken();
    print('triggered API');
    return apiService;
  }

/*  CourseDownloadAPIService() {
    _loadAuthToken();
    print('triggered');
  }*/

  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token') ?? '';
    print('Load Token');
    print(prefs.getString('token'));
  }

  Future<Map<String, dynamic>?> getResult() async {
    final String token = await authToken;
    try {
      if (token.isEmpty) {
        throw Exception('Authentication token is empty.');
      }
      final response = await http.get(
        Uri.parse('$baseUrl/bkiict/coursepdf'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        throw Exception('Failed to load result');
      }
    } catch (e) {
      throw Exception('Error fetching result: $e');
    }
  }
}
