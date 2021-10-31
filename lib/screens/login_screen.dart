import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_signin_test_flutter/api/facebook_login_api.dart';
import 'package:google_signin_test_flutter/api/google_login_api.dart';
import 'package:google_signin_test_flutter/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) { 
                return LinearGradient(colors: [Colors.blue, Colors.indigo]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              child: Text('Logo', style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              constraints: BoxConstraints(
                maxWidth: 200,
              ),
              child: Column(
                children: [
                  /****** GOOGLE *****/
                  ElevatedButton(
                    onPressed: () => _loginWithGoogleClicked(context),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Icon(FontAwesomeIcons.google, color: Colors.orange,),
                        ),
                        Expanded(child: Text('Login with Google', style: TextStyle(color: Colors.grey.shade700),)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                  /****** Facebook *****/
                  ElevatedButton(
                    onPressed: () => _loginWithFacebookClicked(context),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Icon(FontAwesomeIcons.facebookSquare, color: Colors.white,),
                        ),
                        Expanded(child: Text('Login with Google', style: TextStyle(color: Colors.white),)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent
                    ),
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }

  void _loginWithGoogleClicked(context) async{
    final user = await GoogleLoginApi.login();
    if(user != null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(title: 'Google Login Test', googleUser: user, loggedInWith: LoggedInWith.Google,)));
    }
  }

  _loginWithFacebookClicked(BuildContext context) async{
    final user = await FacebookLoginApi.login();
    if(user!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(title: 'Facebook Login Test', facebookUser: user,  loggedInWith: LoggedInWith.Facebook,)));
    }

  }
}
