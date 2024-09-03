import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A service class for handling course registration via an API.
///
/// This class is responsible for sending registration data to the specified
/// API endpoint. It retrieves user data from shared preferences and handles
/// file uploads for registration.
///
/// **Actions:**
/// - [create]: Initializes the service and loads the authentication token.
/// - [sendRegistrationDataFromSharedPreferences]: Sends the registration
///   data, including user details and uploaded files, to the API endpoint.
///   Returns a map containing the response data or null if an error occurs.
///
/// **Variables:**
/// - [apiUrl]: The API endpoint for course registration.
/// - [authToken]: The authentication token used for authorized API requests.
/// - [prefs]: Shared preferences instance to access user data.
/// - [request]: The HTTP multipart request used to send registration data.
/// - [response]: The HTTP response received from the API after sending data.
/// - [jsonResponse]: The decoded JSON response returned from the API upon
///   successful request.
class RegistrationAPIService {
  static const String apiUrl = 'https://www.bcc.touchandsolve.com/api/bkiict/course/registration';

  late final String authToken;

  RegistrationAPIService._();

  static Future<RegistrationAPIService> create() async {
    var apiService = RegistrationAPIService._();
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

  Future<Map<String, dynamic>?> sendRegistrationDataFromSharedPreferences(File? imageFile, File? certificateimageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    });

    request.fields['center_id'] = prefs.getString('Center') ?? '';
    request.fields['course_type'] = prefs.getString('Course Type') ?? '';
    request.fields['course_id'] = prefs.getString('Course Name') ?? '';
    request.fields['course_fee'] = prefs.getString('Fee') ?? '';
    request.fields['batch_id'] = prefs.getString('Batch') ?? '';
    request.fields['full_name'] = prefs.getString('full_name') ?? '';
    request.fields['email'] = prefs.getString('email') ?? '';
    request.fields['phone'] = prefs.getString('phone') ?? '';
    request.fields['dob'] = prefs.getString('date_of_birth') ?? '';
    request.fields['gender'] = prefs.getString('gender') ?? '';
    request.fields['education_qualification'] = prefs.getString('qualification') ?? '';

    final String? discipline = prefs.getString('discipline');
    final String? subjectName = prefs.getString('subject_name');

    if (discipline != null && discipline.isNotEmpty) {
    request.fields['discipline'] = discipline;
    }

    if (subjectName != null && subjectName.isNotEmpty) {
    request.fields['subject_name'] = subjectName;
    }

    request.fields['passing_year'] = prefs.getString('passing_year') ?? '';
    request.fields['institute_name'] = prefs.getString('institute') ?? '';
    request.fields['result'] = prefs.getString('result') ?? '';

    if (imageFile != null) {
      var imageStream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('photo', imageStream, length, filename: imageFile.path.split('/').last);
      request.files.add(multipartFile);
    }
    if (certificateimageFile != null) {
      var imageStream = http.ByteStream(certificateimageFile.openRead());
      var length = await certificateimageFile.length();
      var multipartFile = http.MultipartFile('certificate_photo', imageStream, length, filename: certificateimageFile.path.split('/').last);
      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
        print('Registration data sent successfully');
        print(jsonResponse);
        return jsonResponse;
      } else {
        print('Failed to send registration data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error sending registration data: $e');
      return null;
    }
  }
}