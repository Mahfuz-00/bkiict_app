import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/dropdownoptionsfield.dart';
import 'registrationapplicationreview.dart';

class RegistrationAcademicInformation extends StatefulWidget {
  const RegistrationAcademicInformation({super.key});

  @override
  State<RegistrationAcademicInformation> createState() => _RegistrationAcademicInformationState();
}

class _RegistrationAcademicInformationState extends State<RegistrationAcademicInformation> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<DropdownMenuItem<String>> education = [
    DropdownMenuItem(child: Text("SSC or Equivalent"), value: "SSC or Equivalent"),
    DropdownMenuItem(child: Text("HSC or Equivalent"), value: "HSC or Equivalent"),
    DropdownMenuItem(child: Text("BSc or Equivalent"), value: "BSc or Equivalent"),
    DropdownMenuItem(child: Text("Diploma or Equivalent"), value: "Diploma or Equivalent"),

  ];

  List<DropdownMenuItem<String>> decipline = [
    DropdownMenuItem(child: Text("Science"), value: "Science"),
    DropdownMenuItem(child: Text("Commerce"), value: "Commerce"),
    DropdownMenuItem(child: Text("Arts"), value: "Arts"),
  ];

  late TextEditingController _Qulificationcontroller = TextEditingController();
  late TextEditingController _Deciplinecontroller = TextEditingController();
  late TextEditingController _SubjectNamecontroller = TextEditingController();
  late TextEditingController _PassingYearcontroller = TextEditingController();
  late TextEditingController _Institutecontroller = TextEditingController();
  late TextEditingController _Resultcontroller = TextEditingController();
  late TextEditingController _PassingIDcontroller = TextEditingController();

  late String? Qualification = '';
  File? _imageFile;


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
        scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Container(
              color: Colors.grey[100],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Academic Information(s)',
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),),
                  ),
                  const SizedBox(height: 25),
                  Text('Your Education Qualification',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
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
                          hintText: 'Education Qualification',
                          dropdownItems: education,
                          initialValue: null,
                          onChanged: (value) {
                            setState(() {
                              _Qulificationcontroller.text = value!;
                              Qualification = value!;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 5),
                  if(Qualification == 'SSC or Equivalent'  || Qualification == 'HSC or Equivalent')  ...[
                    Text(
                      'Decipline',
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
                            hintText: 'Decipline',
                            dropdownItems: decipline,
                            initialValue: null,
                            onChanged: (value) {
                              setState(() {
                                _Deciplinecontroller.text = value!;
                              });
                            }),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                  if(Qualification == 'BSc or Equivalent'  || Qualification == 'Diploma or Equivalent') ...[
                    Text(
                      'Subject',
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
                        controller: _SubjectNamecontroller,
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
                          labelText: 'Subject Name',
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
                  ],
                  Text('Passing Year',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: screenWidth * 0.9,
                    height: 70,
                    child: TextFormField(
                      controller: _PassingYearcontroller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please enter your Passing year';
                        }
                        if (input.length != 4) {
                          return 'passing year must be 4 digits';
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
                        labelText: 'Passing Year',
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
                  Text('Institute',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: screenWidth * 0.9,
                    height: 70,
                    child: TextFormField(
                      controller: _Institutecontroller,
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
                        labelText: 'Institute',
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
                  Text('Result',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: screenWidth * 0.9,
                    height: 70,
                    child: TextFormField(
                      controller: _Resultcontroller,
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
                        labelText: 'Result',
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
                  Text('Certificate',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
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
                  SizedBox(height: 15,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size(MediaQuery.of(context).size.width* 0.4, MediaQuery.of(context).size.height * 0.08),
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
                        SizedBox(width: 20,),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
                              fixedSize: Size(MediaQuery.of(context).size.width* 0.4, MediaQuery.of(context).size.height * 0.08),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              saveData();
                              if (validateInputs()) {
                                saveData();
                                print('validated');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const RegistrationApplicationReview(
                                          shouldRefresh: true,
                                        )));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text('Fill up all required fields'),
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
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  bool validateInputs() {
    if(Qualification == 'SSC or Equivalent'  || Qualification == 'HSC or Equivalent')  {
      if(_Deciplinecontroller.text.isEmpty){
        return false;
      }
      return true;
    }
    if(Qualification == 'BSc or Equivalent'  || Qualification == 'Diploma or Equivalent') {
      if(_SubjectNamecontroller.text.isEmpty){
        return false;
      }
      return true;
    }
    if (_Qulificationcontroller.text.isEmpty ||
        _PassingYearcontroller.text.isEmpty ||
        _Institutecontroller.text.isEmpty ||
        _Resultcontroller.text.isEmpty || _imageFile == null) {
      return false;
    }
    return true;
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('qualification', _Qulificationcontroller.text);
    await prefs.setString('decipline', _Deciplinecontroller.text);
    await prefs.setString('subject_name', _SubjectNamecontroller.text);
    await prefs.setString('passing_year', _PassingYearcontroller.text);
    await prefs.setString('institute', _Institutecontroller.text);
    await prefs.setString('result', _Resultcontroller.text);
    if (_imageFile != null) {
      await prefs.setString('certificate_image_path', _imageFile!.path);
    }

    print(await prefs.getString('qualification'));
    print(await prefs.getString('decipline'));
    print(await prefs.getString('subject_name'));
    print(await prefs.getString('passing_year'));
    print(await prefs.getString('institute'));
    print(await prefs.getString('result'));
    print(await prefs.getString('certificate_image_path'));
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
