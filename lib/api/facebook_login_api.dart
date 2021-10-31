import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginApi{
  static Future<Map<String, dynamic>?> login() async{
    LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email']
    );
    if(loginResult.status == LoginStatus.success){
      final userData = await FacebookAuth.instance.getUserData();
      return userData;
    }

  }
}