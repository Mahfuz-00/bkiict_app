import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for managing course download-related API requests.
///
/// This class handles fetching downloadable course resources from the API,
/// specifically course PDFs. It manages the authentication token required
/// for authorized requests.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [_loadAuthToken]: Loads the authentication token from shared preferences.
/// - [getResult]: Fetches the course PDF results from the API, returning
///   the response as a map or null if unsuccessful.
///
/// **Variables:**
/// - [baseUrl]: The base URL for the API.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [token]: The authentication token retrieved for the current session.
/// - [response]: The HTTP response received from the API after fetching data.
/// - [jsonData]: The JSON data received from the API upon a successful request.
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
