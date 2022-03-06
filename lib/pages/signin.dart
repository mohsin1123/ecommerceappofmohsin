import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/widgets/textwidgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late UserProvider userProvider;
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      userProvider.addUserData(
        currentUser: user,
        userEmail: user?.email,
        userImage: user?.photoURL,
        userName: user?.displayName,
      );

      return user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/signinbackground.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.maxFinite,
              child: Column(
                children: [
                  NormalText(
                    text: 'Sign in to continue using the app',
                    size: 15,
                    weight: FontWeight.normal,
                    color: Colors.green.shade900,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'FOOD APP',
                    style: GoogleFonts.vastShadow(
                      fontSize: 40,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () async {
                      await _googleSignUp().then(
                        (value) => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SignInButton(
                    Buttons.FacebookNew,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SignInButton(
                    Buttons.Apple,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NormalText(
                    text: 'By signing in, you are agreeing with our',
                    size: 13,
                    weight: FontWeight.normal,
                    color: Colors.green.shade400,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: NormalText(
                        text: 'Terms & Conditions',
                        size: 14,
                        weight: FontWeight.normal,
                        color: Colors.green.shade500,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
