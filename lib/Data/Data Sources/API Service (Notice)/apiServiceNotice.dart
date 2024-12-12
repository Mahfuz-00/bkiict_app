import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for fetching results from an API.
///
/// This class is responsible for retrieving results by making an HTTP
/// GET request to the specified API endpoint. It handles the loading
/// of the authentication token from shared preferences.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [getResult]: Sends a request to fetch the results. Returns a map containing
///   the result data or throws an exception if an error occurs.
///
/// **Variables:**
/// - [baseUrl]: The base URL for the API endpoint.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [response]: The HTTP response received from the API after the GET request.
/// - [jsonData]: The decoded JSON data returned from the API upon successful request.
class NoticeAPIService {
  final String baseUrl = 'https://bcc.touchandsolve.com/api';
  late final String authToken;

  NoticeAPIService._();

  static Future<NoticeAPIService> create() async {
    var apiService = NoticeAPIService._();
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

  Future<Map<String, dynamic>?> getNotice() async {
    final String token = await authToken;
    try {
      if (token.isEmpty) {
        throw Exception('Authentication token is empty.');
      }
      final response = await http.get(
        Uri.parse('$baseUrl/bkiict/notice'),
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
        throw Exception('Failed to load notice');
      }
    } catch (e) {
      throw Exception('Error fetching notice: $e');
    }
  }
}
