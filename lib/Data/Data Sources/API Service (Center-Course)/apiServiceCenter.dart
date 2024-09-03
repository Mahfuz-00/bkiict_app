import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for managing center-related API requests.
///
/// This class handles the fetching of center items from the specified API endpoint.
/// It manages the authentication token required for authorized requests.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [_loadAuthToken]: Loads the authentication token from shared preferences.
/// - [fetchCenterItems]: Fetches center items from the API and returns
///   the response as a map.
///
/// **Variables:**
/// - [baseUrl]: The base URL for the API.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [response]: The HTTP response received from the API after fetching data.
/// - [jsonData]: The JSON data received from the API upon a successful request.
class CenterAPIService {
  final String baseUrl = 'https://bcc.touchandsolve.com/api';
  late final String authToken;

  CenterAPIService._();

  static Future<CenterAPIService> create() async {
    var apiService = CenterAPIService._();
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

  Future<Map<String, dynamic>> fetchCenterItems() async {
    final String token = await authToken;
    try {
      if (token.isEmpty) {
        throw Exception('Authentication token is empty.');
      }
      final response = await http.get(
        Uri.parse('$baseUrl/bkiict/center'),
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
        throw Exception('Failed to load centers');
      }
    } catch (e) {
      throw Exception('Error fetching centers: $e');
    }
  }
}
