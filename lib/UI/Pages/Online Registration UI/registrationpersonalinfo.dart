import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Widgets/dropdownoptionsfield.dart';
import 'registrationacademicinfo.dart';

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
  late TextEditingController _Emailcontroller = TextEditingController();
  late TextEditingController _Phonecontroller = TextEditingController();
  late TextEditingController _Addresscontroller = TextEditingController();
  late TextEditingController _PostCodecontroller = TextEditingController();
  late TextEditingController _Occupationcontroller = TextEditingController();
  late TextEditingController _Gendercontroller = TextEditingController();
  File? _imageFile;

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
        backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
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
              Text(
                'Your Full Name',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: screenWidth * 0.9,
                height: 70,
                child: TextFormField(
                  controller: _FullNamecontroller,
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
              Text(
                'Your Email Address',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
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
              Text(
                'Your Mobile Number',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: screenWidth * 0.9,
                height: 70,
                child: TextFormField(
                  controller: _Phonecontroller,
                  keyboardType: TextInputType.phone,
                  //maxLength: 11,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    // Only allow digits
                    LengthLimitingTextInputFormatter(11),
                  ],
                  // Limit input length to 11 characters
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter your mobile number name';
                    }
                    if (input.length != 11) {
                      return 'Mobile number must be 11 digits';
                    }
                    return null; // Return null if the input is valid
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
                    labelText: 'Mobile No',
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
              Text(
                'Your Date of Birth',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
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
                    //floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
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
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                            _Datecontroller.text = formattedDate;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        // Adjust the padding as needed
                        child: Icon(
                          Icons.calendar_today_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Your Gender',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
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
              Text(
                'Upload Your Profile Picture',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
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
                        borderSide: BorderSide(
                            color: Colors.red), // Customize error border color
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
                            color: Color.fromRGBO(134, 188, 66, 1),
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.height * 0.08),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.4,
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
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  bool validateInputs() {
    if (_FullNamecontroller.text.isEmpty ||
        _Emailcontroller.text.isEmpty ||
        _Phonecontroller.text.isEmpty ||
        _Datecontroller.text.isEmpty ||
        _Gendercontroller.text.isEmpty ||
        _imageFile == null) {
      return false;
    }
    return true;
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('full_name', _FullNamecontroller.text);
    await prefs.setString('email', _Emailcontroller.text);
    await prefs.setString('phone', _Phonecontroller.text);
    await prefs.setString('date_of_birth', _Datecontroller.text);
    await prefs.setString('gender', _Gendercontroller.text);
    // You can save the image path instead of the whole image if needed
    if (_imageFile != null) {
      await prefs.setString('image_path', _imageFile!.path);
    }

    print(await prefs.getString('full_name'));
    print(await prefs.getString('email'));
    print(await prefs.getString('phone'));
    print(await prefs.getString('date_of_birth'));
    print(await prefs.getString('gender'));
    print(await prefs.getString('image_path'));
  }


  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await _getImageDimensions();
    }
  }

  double _imageHeight = 0;
  double _imageWidth = 0;

  // Function to load image dimensions
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
