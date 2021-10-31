import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginApi{
  static final _googleSignIgn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIgn.signIn();

  static Future<GoogleSignInAccount?> logout() => _googleSignIgn.signOut();
}