import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for handling payment processing via an API.
///
/// This class is responsible for sending payment-related information, such as
/// transaction IDs and exam registration IDs, to the specified API endpoint.
/// It manages the authentication token required for authorized requests.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [_loadAuthToken]: Loads the authentication token from shared preferences.
/// - [sendIdsFromSharedPreferences]: Sends the transaction ID and exam
///   registration ID to the API endpoint and returns a boolean indicating
///   success or failure.
///
/// **Variables:**
/// - [apiUrl]: The API endpoint for course payment registration.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [response]: The HTTP response received from the API after sending data.
/// - [transactionId]: The transaction ID to be sent to the API.
/// - [examRegistrationId]: The exam registration ID to be sent to the API.
class PaymentAPIService {
  static const String apiUrl = 'https://www.bcc.touchandsolve.com/api/bkiict/payment/course/registration';

  late final String authToken;

  PaymentAPIService._();

  static Future<PaymentAPIService> create() async {
    var apiService = PaymentAPIService._();
    await apiService._loadAuthToken();
    print('API service created');
    return apiService;
  }

  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token') ?? '';
    print('Token loaded: $authToken');
  }

  Future<bool> sendIdsFromSharedPreferences(String transactionId, int examRegistrationId) async {
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        body: jsonEncode({
          'transaction_id': transactionId,
          'exam_registration_id': examRegistrationId,
        }),
      );

      if (response.statusCode == 200) {
        print('IDs sent successfully');
        return true;
      } else {
        print('Failed to send IDs. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error sending IDs: $e');
      return false;
    }
  }
}
