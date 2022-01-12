import 'package:flutter/material.dart';
import 'package:flutter_getx_authen_jwt/controllers/authentication_controller.dart';
import 'package:flutter_getx_authen_jwt/models/login_model.dart';
import 'package:flutter_getx_authen_jwt/services/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationController _authCtrl;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _loginService = Get.put(LoginService());
    _authCtrl = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService.fetchLogin(LoginRequestModel(email: email, password: password));

    if(response != null) {
      //Set isLogin to true
      _authCtrl.login(response.token);
    } else {
      //Show user a dialog about the error response
      print("wrong");
    }
  }
}