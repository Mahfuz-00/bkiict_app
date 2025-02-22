import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Core/Connection Checker/internetconnectioncheck.dart';
import '../../../Data/Data Sources/API Service (Payment)/apiServicePayment.dart';
import '../Dashboard UI/dashboardUI.dart';

/// [PaymentConfirmationUI] is a stateful widget that displays the payment confirmation interface.
/// It allows users to confirm their payment for registration and view the success message.
///
/// Variables:
/// - [scaffoldKey]: GlobalKey to manage the state of the scaffold.
/// - [_paymentConfirmationController]: Controller for the payment confirmation TextField.
/// - [buttonloading]: Boolean flag to indicate loading state of the confirm button.
///
/// Actions:
/// - [showSliderAlert]: Displays a modal bottom sheet for Bkash payment confirmation.
class PaymentConfirmationUI extends StatefulWidget {
  const PaymentConfirmationUI({super.key});

  @override
  State<PaymentConfirmationUI> createState() => _PaymentConfirmationUIState();
}

class _PaymentConfirmationUIState extends State<PaymentConfirmationUI>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _paymentConfirmationController =
      TextEditingController();
  bool buttonloading = false;
  String fee = '';
  void loadFee() async {
    final prefs = await SharedPreferences.getInstance();
    fee = prefs.getString('Fee') ?? '';
  }

  @override
  void initState() {
    super.initState();
    loadFee();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InternetConnectionChecker(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[100],
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: const Color(0xFFFF5202),
            titleSpacing: 5,
            automaticallyImplyLeading: false,
            title: const Text(
              'Payment Confirmation',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'default',
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage('Assets/Images/Success-Mark.png'),
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Congratulations, Your Registration Successfully Submitted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFFFF5202),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.85,
                                  MediaQuery.of(context).size.height * 0.08),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              showSliderAlert(context);
                            },
                            child: const Text('Click here for payment',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<Map<String, String>> paymentOptions = [
    {'service': 'Bkash', 'number': '01723882993'},
    {'service': 'Rocket', 'number': '017238829930'},
    {'service': 'Nagad', 'number': '01723882993'},
  ];
  Map<String, String>? selectedPayment;

  void showSliderAlert(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Application Payment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF5202),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'default',
                    ),
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Application Fee : $fee',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFF5202),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton<Map<String, String>>(
                hint: Text('Choose a payment method'),
                value: selectedPayment,
                onChanged: (Map<String, String>? newValue) {
                  setState(() {
                    selectedPayment = newValue;
                  });
                },
                items: paymentOptions.map((Map<String, String> option) {
                  return DropdownMenuItem<Map<String, String>>(
                    value: option,
                    child: Text('${option['service']} - ${option['number']}'),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Trx ID',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFFF5202),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 380,
                  height: 70,
                  child: TextFormField(
                    controller: _paymentConfirmationController,
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
                      labelText: 'Trx ID',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'default',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Enter the Transaction ID from Bkash Payment',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(height: 45),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5202),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                          MediaQuery.of(context).size.height * 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        buttonloading = true;
                      });
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      int id = prefs.getInt('exam_registration_id') ?? 0;
                      print(id);
                      final apiService = await PaymentAPIService.create();

                      final registrationSuccessful =
                          await apiService.sendIdsFromSharedPreferences(
                              _paymentConfirmationController.text, id);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardUI()),
                          (route) => false);
                    },
                    child: buttonloading
                        ? CircularProgressIndicator()
                        : const Text('Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'default',
                            )),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
