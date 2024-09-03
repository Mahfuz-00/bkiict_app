import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for managing course details-related API requests.
///
/// This class handles fetching detailed information about a specific course
/// from the API based on the provided course ID and batch ID. It manages
/// the authentication token required for authorized requests.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [_loadAuthToken]: Loads the authentication token from shared preferences.
/// - [CourseDetail]: Fetches course details from the API based on the specified
///   course ID and batch ID, returning the response as a map.
///
/// **Variables:**
/// - [URL]: The base URL for the API.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [url]: The complete URL for the specific API endpoint to fetch course details.
/// - [headers]: The headers required for the HTTP request, including content type
///   and authorization token.
/// - [response]: The HTTP response received from the API after fetching data.
/// - [jsonData]: The JSON data received from the API upon a successful request.
/// - [Id]: The ID of the course to fetch details for.
/// - [BatchId]: The ID of the batch associated with the course.
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
      );

      if (response.statusCode == 200) {
        print('Course Fetch successfully');
        final jsonData = json.decode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        print('Failed to fetch course details. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch course.');
      }
    } catch (e) {
      print('Error fetching course details: $e');
      throw Exception('Error fetching courses: $e');
    }
  }
}
