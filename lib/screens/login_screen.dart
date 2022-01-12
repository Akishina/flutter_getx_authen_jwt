import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_authen_jwt/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final LoginController _loginCtrl = Get.put(LoginController());

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _formType == FormType.login
            ? const Text('Login')
            : const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: _formType == FormType.login ? loginForm() : registerForm(),
      ),
    );
  }

  Form loginForm() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameCtrl,
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Please Enter Name'
                    : null;
              },
              decoration: inputDecoration('Name', Icons.person),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordCtrl,
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Please Enter Password'
                    : null;
              },
              decoration: inputDecoration('Password', Icons.lock),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    await _loginCtrl.loginUser(
                        nameCtrl.text, passwordCtrl.text);
                  }
                },
                child: const Text('login')),
            TextButton(
                onPressed: () {
                  setState(() {
                    _formType = FormType.register;
                  });
                },
                child: const Text('Does not have an account?')),
          ],
        ));
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Name'
                  : null;
            },
            decoration: inputDecoration('Name', Icons.person),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Password'
                  : null;
            },
            controller: passwordCtrl,
            decoration: inputDecoration('Password', Icons.lock),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
  );
}

enum FormType { login, register }
