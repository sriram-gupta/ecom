import 'dart:convert';
import 'dart:ui';
import 'package:fe/api/zz_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool isButtonActive = false;
  bool otpMode = false; // To track if OTP input is visible

  void sendOTP() async {
    AuthService authService = AuthService();
    Response sentOtpResp =
        await authService.generateOtp(phoneNumberController.text);
    String otp = json.decode(sentOtpResp.body)['otp'];

    // Implement your logic to send an OTP here
    // For this example, let's consider the button as active
    setState(() {
      isButtonActive = true;
      otpMode = true; // Switch to OTP input mode
    });

    Future.delayed(const Duration(seconds: 2), () {
      otpController.text = otp; // This will execute after a 2-second delay
    });
  }

  void login() async {
    AuthService authService = AuthService();
    Response sentOtpResp = await authService.verifyOtp(
        phoneNumberController.text, otpController.text);

    if (sentOtpResp.statusCode == 200) {
      Map tokens = json.decode(sentOtpResp.body);
      context.pushReplacement("/home");
    } else {
      // Display an error message
      final snackBar = SnackBar(
        content: Text('Invalid OTP'),
        duration: Duration(seconds: 1), // You can adjust the duration
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      otpController.clear();
    }

    // Implement your login logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.white.withOpacity(0.0),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: otpMode
                    ? Column(
                        children: [
                          TextField(
                            style: TextStyle(fontSize: 20),
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            maxLength: 4, // Set the max length to 4 for OTP
                            decoration: InputDecoration(
                              labelText: 'Enter OTP',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: login,
                            child:
                                Text('Login'), // Change button text to "Login"
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            width: 300,
                            height: 60,
                            child: TextField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Enter Phone Number',
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onTap: () {
                                // Show the phone number keyboard when the field is tapped
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              onChanged: (value) {
                                setState(() {
                                  isButtonActive = value.length == 10;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: isButtonActive ? sendOTP : null,
                            child: Text('Send OTP'),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
