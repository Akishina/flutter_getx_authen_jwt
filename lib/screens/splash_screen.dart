import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_authen_jwt/controllers/authentication_controller.dart';
import 'package:flutter_getx_authen_jwt/managers/on_board.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final AuthenticationController _authCtrl =
      Get.put(AuthenticationController());

  Future<void> initializeSettings() async {
    _authCtrl.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeSettings(), builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return waitingView();
          } else {
            if(snapshot.hasError) {
              return errorView(snapshot);
            } else {
              return const OnBoard();
            }
          }
    });
    // TODO: implement build
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator(),),
            Text('Loading...'),
          ],
        )
      )
    );
  }
}
