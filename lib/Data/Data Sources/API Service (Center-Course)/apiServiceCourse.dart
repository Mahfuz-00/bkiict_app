import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for managing course option-related API requests.
///
/// This class handles the fetching of course items based on the specified center
/// and course type from the API endpoint. It manages the authentication token
/// required for authorized requests.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [_loadAuthToken]: Loads the authentication token from shared preferences.
/// - [fetchCourseItems]: Fetches course items from the API based on the
///   provided center ID and course type, returning the response as a map.
///
/// **Variables:**
/// - [baseUrl]: The base URL for the API.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [response]: The HTTP response received from the API after fetching data.
/// - [jsonData]: The JSON data received from the API upon a successful request.
/// - [Id]: The ID of the center for which courses are being fetched.
/// - [coursetype]: The type of course to fetch.
class CourseOptionAPIService {
  final String baseUrl = 'https://bcc.touchandsolve.com/api';
  late final String authToken;

  CourseOptionAPIService._();

  static Future<CourseOptionAPIService> create() async {
    var apiService = CourseOptionAPIService._();
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

  Future<Map<String, dynamic>> fetchCourseItems({required int Id, required String coursetype}) async {
    final String token = await authToken;
    try {
      if (token.isEmpty) {
        throw Exception('Authentication token is empty.');
      }
      final response = await http.get(
        Uri.parse('$baseUrl/bkiict/center/type/wise/course/$Id/$coursetype'),
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
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      throw Exception('Error fetching courses: $e');
    }
  }
}
