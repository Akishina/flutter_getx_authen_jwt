import 'package:flutter_getx_authen_jwt/managers/cache_manager.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if(token != null) {
      isLogged.value = true;
    }
  }
}