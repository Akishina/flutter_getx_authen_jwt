
import 'package:flutter_getx_authen_jwt/models/login_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class LoginService extends GetConnect {
  final String loginUrl = 'http://blog-api.meika.xyz/api/user/login';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if(response.statusCode == HttpStatus.ok){
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}