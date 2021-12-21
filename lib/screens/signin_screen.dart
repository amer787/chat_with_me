import 'package:chat_with_me/screens/chat_screen.dart';
import 'package:chat_with_me/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'signin_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/ic1.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  //هنا علشان الكيبورد يتغير ويسهل التسجيل
                  textAlign: TextAlign.center,
                  //هنا احط الكلام بالنص ادخل اميلك وباسسودك
                  onChanged: (value) {
                    email = value;
                  },

                  // here button action user
                  decoration: InputDecoration(
                    // here editing inside field
                    hintText: 'Enter your Email',
                    // here write inside field
                    contentPadding: EdgeInsets.symmetric(
                      //here add specs inside field
                      vertical: 10, //عامودي
                      horizontal: 20, //اوفقي
                    ),
                    border: OutlineInputBorder(
                      //هنا تحط حدود دائريه للحقل 10 يعني الانحناء الكل
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    //(enabledBorder) (border)هنا اذا ماضغطة على الحقل يكون عادي بحط نفس اعدادات
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    //(focusedBorder)
                    // هنا اذا ضغطة على الحقل يكون فيه تاثير علشان تحس انك ضغط بحط لون مختلف شوي
                    // بحط نفس اعدادات (border) بس بغير الون
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                TextField(
                  obscureText: true,
                  //هنا علشان الباسوورد يكون مخفي
                  textAlign: TextAlign.center,
                  //هنا احط الكلام بالنص ادخل اميلك وباسسودك
                  onChanged: (value) {
                    password = value;

                },
                  // here button action user
                  decoration: InputDecoration(
                    // here editing inside field
                    hintText: 'Enter your Password',
                    // here write inside field
                    contentPadding: EdgeInsets.symmetric(
                      //here add specs inside field
                      vertical: 10, //عامودي
                      horizontal: 20, //اوفقي
                    ),
                    border: OutlineInputBorder(
                      //هنا تحط حدود دائريه للحقل 10 يعني الانحناء الكل
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    //(enabledBorder) (border)هنا اذا ماضغطة على الحقل يكون عادي بحط نفس اعدادات
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    // هنا اذا ضغطة على الحقل يكون فيه تاثير علشان تحس انك ضغط بحط لون مختلف شوي
                    // بحط نفس اعدادات (border) بس بغير الون
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                //this button my create
                MyButton(
                  color: Colors.blue[400],
                  title: 'Sing in ',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.screenRoute);
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
