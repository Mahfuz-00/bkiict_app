import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../Models/registermodels.dart';

/// A service class for handling user registration via an API.
///
/// This class manages the process of registering a user, including
/// the submission of user details and an optional profile photo.
///
/// **Actions:**
/// - [register]: Sends a registration request to the API with the user details
///   and an optional image file. Returns a message indicating the success or
///   failure of the registration.
///
/// **Variables:**
/// - [url]: The endpoint URL for user registration.
/// - [request]: The multipart request object used to send user registration data.
/// - [imageStream]: A stream representing the image file being uploaded.
/// - [length]: The size of the image file being uploaded.
/// - [multipartFile]: The file object added to the request for the profile photo.
/// - [response]: The response received from the API after sending the request.
/// - [responseBody]: The body of the response, converted to a string.
/// - [jsonResponse]: The JSON-decoded response body containing success or error messages.
/// - [errors]: A map containing validation errors returned from the API, if any.
/// - [emailError]: A specific error message related to the email field, if applicable.
/// - [phoneError]: A specific error message related to the phone field, if applicable.
/// - [errorMessage]: A combined error message for display if validation errors are present.
class UserRegistrationAPIService {
  Future<String> register(
      RegisterRequestmodel registerRequestModel, File? imageFile) async {
    try {
      String url = "https://bcc.touchandsolve.com/api/registration";
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['app_name'] = 'bkiict';
      request.fields['full_name'] = registerRequestModel.fullName;
      request.fields['email'] = registerRequestModel.email;
      request.fields['phone'] = registerRequestModel.phone;
      request.fields['password'] = registerRequestModel.password;
      request.fields['password_confirmation'] = registerRequestModel.confirmPassword;

      var imageStream = http.ByteStream(imageFile!.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('photo', imageStream, length,
          filename: imageFile.path.split('/').last);

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        print('User registered successfully!');
        print(jsonResponse['message']);
        return jsonResponse['message'];
      } else {
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
        var jsonResponse = jsonDecode(responseBody);
        print('Failed to register user: $jsonResponse');

        if (jsonResponse.containsKey('errors')) {
          var errors = jsonResponse['errors'];
          print(errors);
          var emailError = errors.containsKey('email') ? errors['email'][0] : '';
          var phoneError = errors.containsKey('phone') ? errors['phone'][0] : '';

          var errorMessage = '';
          if (emailError.isNotEmpty) errorMessage = emailError;
          if (phoneError.isNotEmpty) errorMessage = phoneError;

          print(errorMessage);
          return errorMessage;}
        else {
          print('Failed to register user: $responseBody');
          return 'Failed to register user. Please try again.';
        }
      }
    } catch (e) {
      print('Error occurred while registering user: $e');
      return 'Failed to register user. Please try again.';
    }
  }
}
