import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.1.4:3000';

  Future generateOtp(phone_number) async {
    final response = await http.post(Uri.parse(baseUrl + "/auth/generateOtp"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"phone_number": phone_number.toString()}));
    return response;
  }

  Future verifyOtp(phone_number, otp) async {
    final response = await http.post(Uri.parse(baseUrl + "/auth/verifyOtp"),
        headers: {'Content-Type': 'application/json'},
        body:
            jsonEncode({"phone_number": phone_number.toString(), "otp": otp}));
    return response;
  }
}
