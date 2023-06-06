import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  bool _isLoggedIn = false;
  bool _isFBLoggedIn = false;
  GoogleSignInAccount ?_userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Map ?_userFBObj = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Google Sign In")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _isLoggedIn
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _userObj!.photoUrl!=null? Image.network(_userObj!.photoUrl.toString()):Icon(Icons.account_circle_outlined,color: Colors.black,size: 45.0),
                Text(_userObj!.displayName.toString(),style: TextStyle(fontSize: 16.0,)),
                Text(_userObj!.email.toString(),style: TextStyle(fontSize: 16.0,)),
                TextButton(
                    onPressed: () {
                      _googleSignIn.signOut().then((value) {
                        setState(() {
                          _isLoggedIn = false;
                        });
                      }).catchError((e) {});
                    },
                    child: Text("Logout"))
              ],
            )
                : Center(
              child: ElevatedButton(
                child: Text("Login with Google"),
                onPressed: () {
                  _googleSignIn.signIn().then((userData) {
                    setState(() {
                      _isLoggedIn = true;
                      _userObj = userData;
                      print("userData"+userData.toString());
                    });
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ),
            _isFBLoggedIn
                ? Column(
              children: [
                Image.network(_userFBObj!["picture"]["data"]["url"]),
                Text(_userFBObj!["name"]),
                Text(_userFBObj!["email"]),
                TextButton(
                    onPressed: () {
                      FacebookAuth.instance.logOut().then((value) {
                        setState(() {
                          _isLoggedIn = false;
                          _userFBObj = {};
                        });
                      });
                    },
                    child: Text("Logout"))
              ],
            )
                : Center(
              child: ElevatedButton(
                child: Text("Login with Facebook"),
                onPressed: () async {
                  FacebookAuth.instance.login(
                      permissions: ["public_profile", "email"]).then((value) {
                    FacebookAuth.instance.getUserData().then((userData) {
                      setState(() {
                        _isLoggedIn = true;
                        _userFBObj = userData;
                      });
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}