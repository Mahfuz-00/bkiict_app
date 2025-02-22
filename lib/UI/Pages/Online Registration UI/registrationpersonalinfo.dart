import 'dart:io';
import 'package:bkiict_app/UI/Widgets/labelText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/dropdownoptionsfield.dart';
import 'registrationacademicinfo.dart';

/// [RegistrationPersonalInformationUI] is a StatefulWidget that represents the
/// user interface for collecting personal information during registration.
///
/// It manages user inputs such as [Full Name], [Email Address],
/// [Mobile Number], [Date of Birth], and [Gender]. It also allows users
/// to upload a profile picture. The data entered by the user can be
/// validated and processed for further use.
///
/// **Variables:**
/// - [scaffoldKey]: GlobalKey to manage the state of the scaffold.
/// - [Datecontroller]: Controller for the Date of Birth text field.
/// - [FullNamecontroller]: Controller for the Full Name text field.
/// - [Emailcontroller]: Controller for the Email Address text field.
/// - [Phonecontroller]: Controller for the Mobile Number text field.
/// - [Gendercontroller]: Controller for the Gender text field.
/// - [imageFile]: Optional File to hold the selected image for the profile picture.
/// - [gender]: List of DropdownMenuItem for selecting Gender.
///
/// **Actions:**
/// - [dispose]: Disposes the Datecontroller when the widget is removed from the widget tree.
/// - [build]: Builds the widget tree for the Registration Personal Information UI.
class RegistrationPersonalInformationUI extends StatefulWidget {
  const RegistrationPersonalInformationUI({super.key});

  @override
  State<RegistrationPersonalInformationUI> createState() =>
      _RegistrationPersonalInformationUIState();
}

class _RegistrationPersonalInformationUIState
    extends State<RegistrationPersonalInformationUI>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _Datecontroller = TextEditingController();
  late TextEditingController _FullNamecontroller = TextEditingController();
  late TextEditingController _FatherNamecontroller = TextEditingController();
  late TextEditingController _MotherNamecontroller = TextEditingController();
  late TextEditingController _Emailcontroller = TextEditingController();
  late TextEditingController _Phonecontroller = TextEditingController();
  late TextEditingController _WhatsAppcontroller = TextEditingController();
  late TextEditingController _Gendercontroller = TextEditingController();
  late TextEditingController _FBcontroller = TextEditingController();
  late TextEditingController _CurrentAddresscontroller = TextEditingController();
  late TextEditingController _PermanentAddresscontroller = TextEditingController();
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String?>> gender = [
    DropdownMenuItem(child: Text("Male"), value: "Male"),
    DropdownMenuItem(child: Text("Female"), value: "Female"),
  ];

  @override
  void dispose() {
    _Datecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5202),
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        title: const Text(
          'Registration Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'default',
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Personal Information(s)',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabeledTextWithAsterisk(text: 'Your Full Name'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _FullNamecontroller,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Father Name'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _FatherNamecontroller,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your father name';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Father Name',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Mother Name'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _MotherNamecontroller,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your mother name';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Mother Name',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Date of Birth'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 60,
                        child: TextFormField(
                          controller: _Datecontroller,
                          readOnly: true,
                          enableInteractiveSelection: false,
                          enableSuggestions: false,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    final formattedDate =
                                    DateFormat('yyyy-MM-dd')
                                        .format(selectedDate);
                                    _Datecontroller.text = formattedDate;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(
                                  Icons.calendar_today_outlined,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Mobile Number'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _Phonecontroller,
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
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Whatsapp Number'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _WhatsAppcontroller,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                          ],
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your whatsapp number';
                            }
                            if (input.length != 11) {
                              return 'Mobile number must be 11 digits';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Whatsapp number',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Email Address'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _Emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your email address';
                            }
                            final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegex.hasMatch(input)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Facebook ID'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _FBcontroller,
                          keyboardType: TextInputType.text,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your facebook id';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Facebook ID',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Present Address'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _CurrentAddresscontroller,
                          keyboardType: TextInputType.text,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your present address';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Present Address',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      LabeledTextWithAsterisk(text: 'Your Permanent Address'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        height: 70,
                        child: TextFormField(
                          controller: _PermanentAddresscontroller,
                          keyboardType: TextInputType.text,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your permanent address';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Permanent Address',
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'default',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 15),
              LabeledTextWithAsterisk(text: 'Your Gender'),
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.075,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownField(
                      hintText: 'Gender',
                      dropdownItems: gender
                          .where((item) => item != null)
                          .map((item) => item!)
                          .toList(),
                      initialValue: null,
                      onChanged: (value) {
                        setState(() {
                          _Gendercontroller.text = value!;
                        });
                      }),
                ),
              ),
              const SizedBox(height: 15),
              LabeledTextWithAsterisk(text: 'Upload Your Photo(Passport Size)'),
              SizedBox(
                height: 5,
              ),
              Container(
                width: (_imageWidth != 0
                    ? (_imageWidth + 10).clamp(0, screenWidth * 0.9)
                    : screenWidth * 0.9),
                height: (_imageHeight != 0
                    ? (_imageHeight + 10).clamp(0, 200)
                    : 80),
                child: InkWell(
                  onTap: _selectImage,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context)),
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
                              : Center(
                                  child: Icon(Icons.image,
                                      size: 60, color: Colors.grey),
                                ),
                        ),
                        SizedBox(width: 8),
                        VerticalDivider(
                          thickness: 5,
                        ),
                        Text(
                          'Upload',
                          style: TextStyle(
                            color: Color(0xFFFF5202),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'default',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1EB257),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                          MediaQuery.of(context).size.height * 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      if (validateInputs()) {
                        saveData();
                        print('validated');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationAcademicInformationUI()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Fill up all required fields'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: const Text('Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'default',
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  bool validateInputs() {
    if (_formKey.currentState!.validate()) {
      if (_FullNamecontroller.text.isEmpty ||
          _Emailcontroller.text.isEmpty ||
          _Phonecontroller.text.isEmpty ||
          _Datecontroller.text.isEmpty ||
          _Gendercontroller.text.isEmpty ||
          _FatherNamecontroller.text.isEmpty ||
          _MotherNamecontroller.text.isEmpty ||
          _FBcontroller.text.isEmpty ||
          _CurrentAddresscontroller.text.isEmpty ||
          _PermanentAddresscontroller.text.isEmpty ||
          _imageFile == null) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('full_name', _FullNamecontroller.text);
    await prefs.setString('email', _Emailcontroller.text);
    await prefs.setString('phone', _Phonecontroller.text);
    await prefs.setString('date_of_birth', _Datecontroller.text);
    await prefs.setString('gender', _Gendercontroller.text);
    await prefs.setString('father_name', _FatherNamecontroller.text);
    await prefs.setString('mother_name', _MotherNamecontroller.text);
    await prefs.setString('facebook_id', _FBcontroller.text);
    await prefs.setString('current_address', _CurrentAddresscontroller.text);
    await prefs.setString('permanent_address', _PermanentAddresscontroller.text);
    await prefs.setString('whatsapp_number', _WhatsAppcontroller.text);
    if (_imageFile != null) {
      await prefs.setString('image_path', _imageFile!.path);
    }

    print(await prefs.getString('full_name'));
    print(await prefs.getString('email'));
    print(await prefs.getString('phone'));
    print(await prefs.getString('date_of_birth'));
    print(await prefs.getString('gender'));
    print(await prefs.getString('image_path'));
    print(await prefs.getString('father_name'));
    print(await prefs.getString('mother_name'));
    print(await prefs.getString('facebook_id'));
    print(await prefs.getString('current_address'));
    print(await prefs.getString('permanent_address'));
    print(await prefs.getString('whatsapp_number'));
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
                color: Color(0xFFFF5202),
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
              color: Color(0xFFFF5202),
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
}
