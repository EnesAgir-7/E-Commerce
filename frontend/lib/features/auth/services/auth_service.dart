import 'package:ea_software/constants/error_handling.dart';
import 'package:ea_software/constants/global_variables.dart';
import 'package:ea_software/constants/utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // Sign-Up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '', 
        name: name, 
        password: password, 
        email: email, 
        address: '', 
        type: '', 
        token: ''
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: < String, String > {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}