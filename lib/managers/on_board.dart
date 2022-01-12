import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_authen_jwt/controllers/authentication_controller.dart';
import 'package:flutter_getx_authen_jwt/screens/home_screen.dart';
import 'package:flutter_getx_authen_jwt/screens/login_screen.dart';
import 'package:get/get.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationController _authCtrl = Get.find();

    return Obx(() {
      return _authCtrl.isLogged.value ? const HomeScreen() : const LoginScreen();
    });
    // TODO: implement build
  }

}