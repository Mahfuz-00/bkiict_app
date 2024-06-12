import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();

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
