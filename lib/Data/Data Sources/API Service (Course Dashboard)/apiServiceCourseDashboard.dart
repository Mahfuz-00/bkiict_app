import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for managing course dashboard-related API requests.
///
/// This class handles fetching course data based on the specified type from
/// the API endpoint. It manages the authentication token required for authorized
/// requests.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [_loadAuthToken]: Loads the authentication token from shared preferences.
/// - [Courses]: Fetches courses from the API based on the provided type,
///   returning the response as a map.
///
/// **Variables:**
/// - [URL]: The base URL for the API.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [url]: The complete URL for the specific API endpoint to fetch courses.
/// - [headers]: The headers required for the HTTP request, including content type
///   and authorization token.
/// - [body]: The request body containing the type of course to fetch.
/// - [response]: The HTTP response received from the API after fetching data.
/// - [jsonData]: The JSON data received from the API upon a successful request.
/// - [type]: The type of course to fetch from the API.
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
      );

      if (response.statusCode == 200) {
        print('Course Fetch successfully');
        final jsonData = json.decode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        print('Failed to fetch course. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch course.');
      }
    } catch (e) {
      print('Error fetching course: $e');
      throw Exception('Error fetching courses: $e');
    }
  }
}
