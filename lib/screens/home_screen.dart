
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin_test_flutter/api/google_login_api.dart';

enum LoggedInWith {Google, Facebook}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title, this.googleUser, this.facebookUser, required this.loggedInWith,}) : super(key: key);

  final String title;
  final LoggedInWith loggedInWith;
  final GoogleSignInAccount? googleUser;
  final Map<String, dynamic>? facebookUser;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        // Here we take the value from the HomeScreen object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: Image.network("${widget.loggedInWith == LoggedInWith.Google ? widget.googleUser?.photoUrl : widget.facebookUser?['picture']['data']['url']}").image,
              radius: 70,
            ),
            SizedBox(height: 20,),
            Text(
              'Logged in as ${widget.loggedInWith == LoggedInWith.Google ? widget.googleUser?.email : widget.facebookUser?['email']}',
            ),
            SizedBox(height: 20,),
            Text(
              'Name ${widget.loggedInWith == LoggedInWith.Google ? widget.googleUser?.displayName : widget.facebookUser?['name']}',
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: logoutClicked, child: Text('Logout'))
          ],
        ),
      ),
    );
  }

  void logoutClicked() async{
    if(widget.loggedInWith == LoggedInWith.Google){
      await GoogleLoginApi.logout();
      Navigator.pop(context);
    }else{
      await FacebookAuth.instance.logOut();
      Navigator.pop(context);
    }

  }
}
