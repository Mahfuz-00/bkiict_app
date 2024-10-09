import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Core/Connection Checker/internetconnectioncheck.dart';
import '../../../Data/Data Sources/API Service (Sign Up)/apiserviceregister.dart';
import '../../../Data/Models/registermodels.dart';
import '../../Widgets/CustomTextField.dart';
import '../Login UI/loginUI.dart';

/// The [SignupUI] class is a stateful widget that facilitates user registration.
/// It includes form fields for user input, handles image uploads, and manages
/// the registration process via an API service.
///
/// [globalfromkey]: Key to uniquely identify the form widget for validation.
/// [globalKey]: Key to uniquely identify the scaffold state for the UI.
/// [_fullNameController]: Controller for the full name text field.
/// [_emailController]: Controller for the email text field.
/// [_phoneController]: Controller for the phone number text field.
/// [_passwordController]: Controller for the password text field.
/// [_confirmPasswordController]: Controller for the confirm password text field.
/// [_registerRequest]: Model object that holds the user registration data.
/// [_imageFile]: Variable to hold the selected profile image file.
/// [_isLoading]: Flag to indicate if the UI is in a loading state.
/// [_isButtonLoading]: Flag to indicate if the registration button is in a loading state.
/// [_imageHeight]: Variable to store the height of the selected image.
/// [_imageWidth]: Variable to store the width of the selected image.
/// [_isObscuredPassword]: Flag to toggle password visibility for the password field.
/// [_isObscuredConfirmPassword]: Flag to toggle password visibility for the confirm password field.
///
/// Actions:
/// [_getImageDimensions]: Fetches and updates the dimensions of the selected image.
/// [_selectImage]: Prompts the user to select an image for the profile picture.
/// [_registerUser]: Handles user registration, validates input, and communicates with the API service.
class SignupUI extends StatefulWidget {
  const SignupUI({super.key});

  @override
  State<SignupUI> createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  bool _isObscuredPassword = true;
  bool _isObscuredConfirmPassword = true;
  late RegisterRequestmodel _registerRequest;
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  File? _imageFile;
  var globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalfromkey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isButtonLoading = false;
  double _imageHeight = 0;
  double _imageWidth = 0;

  Future<void> _getImageDimensions() async {
    if (_imageFile != null) {
      final data = await _imageFile!.readAsBytes();
      final image = await decodeImageFromList(data);
      setState(() {
        _imageHeight = image.height.toDouble();
        _imageWidth = image.width.toDouble();
      });
    }
  }

  IconData _getIconPassword() {
    return _isObscuredPassword ? Icons.visibility_off : Icons.visibility;
  }

  IconData _getIconConfirmPassword() {
    return _isObscuredConfirmPassword ? Icons.visibility_off : Icons.visibility;
  }

  @override
  void initState() {
    super.initState();
    _registerRequest = RegisterRequestmodel(
      fullName: '',
      email: '',
      phone: '',
      password: '',
      confirmPassword: '',
    );
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InternetConnectionChecker(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Column(children: [
                      const Text(
                        'Hello! Register to get started!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(134, 188, 66, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'default',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Sign in to see how we manage',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(143, 150, 158, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'default',
                        ),
                      ),
                      const SizedBox(height: 50),
                      Form(
                        key: globalfromkey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: _fullNameController,
                              labelText: 'Full Name',
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Please enter your email address';
                                }
                                final emailRegex =
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(input)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              labelText: 'Email address',
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: _phoneController,
                              labelText: 'Mobile Number',
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),
                              ],
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Please enter your mobile number';
                                }
                                if (input.length != 11) {
                                  return 'Mobile number must be 11 digits';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: _passwordController,
                              labelText: 'Password',
                              hinttext:
                                  "Password should be more than 7 characters and must include an uppercase letter, a lowercase letter, a number, and a special character.",
                              validator: (input) {
                                if (input!.length < 8) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Password should be more than 7 characters"),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  return "Password should be more than 7 characters";
                                } else if (!RegExp(
                                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]')
                                    .hasMatch(input)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Password must include an uppercase letter, a lowercase letter, a number, and a special character."),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  return "Password must contain uppercase, lowercase, number, and special character";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: _isObscuredPassword,
                              suffixIcon: IconButton(
                                icon: Icon(_getIconPassword()),
                                onPressed: () {
                                  setState(() {
                                    _isObscuredPassword = !_isObscuredPassword;
                                    _passwordController.text =
                                        _passwordController.text;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: _confirmPasswordController,
                              labelText: 'Confirm Password',
                              hinttext:
                                  "Password should be more than 7 characters and must include an uppercase letter, a lowercase letter, a number, and a special character.",
                              validator: (input) {
                                if (input!.length < 8) {
                                  return "Password should be more than 7 characters";
                                } else if (!RegExp(
                                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]')
                                    .hasMatch(input)) {
                                  return "Password must contain uppercase, lowercase, number, and special character";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: _isObscuredConfirmPassword,
                              suffixIcon: IconButton(
                                icon: Icon(_getIconConfirmPassword()),
                                onPressed: () {
                                  setState(() {
                                    _isObscuredConfirmPassword =
                                        !_isObscuredConfirmPassword;
                                    _confirmPasswordController.text =
                                        _confirmPasswordController.text;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: (_imageWidth != 0
                                  ? (_imageWidth + 16)
                                      .clamp(0, screenWidth * 0.9)
                                  : screenWidth * 0.9),
                              height: (_imageHeight != 0
                                  ? (_imageHeight + 16).clamp(0, 200)
                                  : 80),
                              child: InkWell(
                                onTap: _selectImage,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            Divider.createBorderSide(context)),
                                    labelText: 'Add Profile Picture',
                                    labelStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'default',
                                    ),
                                    errorMaxLines: null,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _imageFile != null
                                            ? Image.file(
                                                _imageFile!,
                                                width: null,
                                                height: null,
                                                fit: BoxFit.contain,
                                              )
                                            : Icon(Icons.image,
                                                size: 60, color: Colors.grey),
                                      ),
                                      SizedBox(width: 8),
                                      VerticalDivider(
                                        thickness: 5,
                                      ),
                                      Text(
                                        'Upload',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(134, 188, 66, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'default',
                                        ),
                                      ),
                                      // Customize upload text style
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: _registerUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(134, 188, 66, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize: Size(screenWidth * 0.9, 70),
                          ),
                          child: _isButtonLoading
                              ? CircularProgressIndicator()
                              : const Text('Register',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'default',
                                  ))),
                    ])),
                    Footer(
                      backgroundColor: Color.fromRGBO(246, 246, 246, 255),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 150, 158, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginUI()));
                                },
                                child: const Text(
                                  'Login now',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(134, 188, 66, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'default',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    setState(() {
      _isButtonLoading = true;
    });
    if (validateAndSave() && checkConfirmPassword()) {
      const snackBar = SnackBar(
        content: Text('Processing'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      final registerRequest = RegisterRequestmodel(
        fullName: _fullNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );

      final apiService = UserRegistrationAPIService();
      apiService.register(registerRequest, _imageFile).then((response) {
        print("Submitted");
        if (response != null && response == "User Registration Successfully.") {
          setState(() {
            _isButtonLoading = false;
          });
          clearForm();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginUI()),
          );
          const snackBar = SnackBar(
            content: Text('Registration Submitted!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (response != null &&
            response == "The email has already been taken.") {
          setState(() {
            _isButtonLoading = false;
          });
          const snackBar = SnackBar(
            content: Text(
                'The Email is Taken!, Please Try entering a different Email'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (response != null &&
            response == "The phone has already been taken.") {
          setState(() {
            _isButtonLoading = false;
          });
          const snackBar = SnackBar(
            content: Text(
                'The Phone Number is Taken!, Please Try a different Number'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          setState(() {
            _isButtonLoading = false;
          });
          const snackBar = SnackBar(
            content: Text('Registration Failed!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }).catchError((error) {
        setState(() {
          _isButtonLoading = false;
        });
        print(error);
        const snackBar = SnackBar(
          content: Text('Registration failed!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      setState(() {
        _isButtonLoading = false;
      });
      if (_passwordController.text != _confirmPasswordController.text) {
        const snackBar = SnackBar(
          content: Text('Passwords do not match'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (validateAndSave() == false) {
        const snackBar = SnackBar(
          content: Text('Fill all Fields'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  bool validateAndSave() {
    final form = globalfromkey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  bool checkConfirmPassword() {
    return _passwordController.text == _confirmPasswordController.text;
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Choose an option',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 162, 222, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'default',
                fontSize: 22,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text(
                  'Gallery',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                    fontSize: 18,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    // Check the file size
                    final file = File(pickedFile.path);
                    final fileSize = await file.length();
                    if (fileSize <= 5 * 1024 * 1024) {
                      // 5 MB
                      setState(() {
                        _imageFile = file;
                      });
                      await _getImageDimensions();
                    } else {
                      _showErrorDialog("Image must be less than 5 MB.");
                    }
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text(
                  'Camera',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                    fontSize: 18,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    // Check the file size
                    final file = File(pickedFile.path);
                    final fileSize = await file.length();
                    if (fileSize <= 5 * 1024 * 1024) {
                      // 5 MB
                      setState(() {
                        _imageFile = file;
                      });
                      await _getImageDimensions();
                    } else {
                      _showErrorDialog("Image must be less than 5 MB.");
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Error",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(0, 162, 222, 1),
              fontWeight: FontWeight.bold,
              fontFamily: 'default',
              fontSize: 22,
            ),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void clearForm() {
    _fullNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _imageFile = null;
    });
  }
}
