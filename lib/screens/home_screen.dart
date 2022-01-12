import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_authen_jwt/controllers/authentication_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final AuthenticationController _authCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: () {
            _authCtrl.logOut();
          }, icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: const Center(
        child: Text('HOME VIEW'),
      ),
    );
    // TODO: implement build
  }


}