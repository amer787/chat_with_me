import 'package:chat_with_me/screens/registration_screen.dart';
import 'package:chat_with_me/screens/signin_screen.dart';
import 'package:chat_with_me/widgets/my_button.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(child:
                Image.asset('images/ic1.png'),
                ),
                Text('Chat with me',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0Xff2e386b),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            MyButton(
              color: Colors.blue[400],
              title: 'Sing in ',
              onPressed: (){
                Navigator.pushNamed(context, SignInScreen.screenRoute);
              },
            ),
            MyButton(
              color: Color(0Xff2e386b),
              title: 'register',
              onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.screenRoute);
              },
            ),// Padding
          ],
        ),
      ),
    );
  }
}

