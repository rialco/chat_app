import 'package:flutter_app_chat/widgets/custombutton.dart';
import 'package:flutter_app_chat/widgets/customtextinput.dart';
import 'package:flutter/material.dart';

class ChatterLogin extends StatefulWidget {
  @override
  _ChatterLoginState createState() => _ChatterLoginState();
}

class _ChatterLoginState extends State<ChatterLogin> {
  late String email;
  late String password;
  bool loggingin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'heroicon',
                  child: Icon(
                    Icons.textsms,
                    size: 120,
                    color: Colors.deepPurple[900],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Hero(
                  tag: 'HeroTitle',
                  child: Text(
                    'Secret Chatter',
                    style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomTextInput(
                  hintText: 'Email',
                  leading: Icons.mail,
                  obscure: false,
                  keyboard: TextInputType.emailAddress,
                  userTyped: (val) {
                    email = val;
                  },
                ),
                const SizedBox(
                  height: 0,
                ),
                CustomTextInput(
                  hintText: 'Contraseña',
                  leading: Icons.lock,
                  obscure: true,
                  userTyped: (val) {
                    password = val;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Hero(
                  tag: 'loginbutton',
                  child: CustomButton(
                      text: 'login',
                      accentColor: Colors.white,
                      mainColor: Colors.deepPurple,
                      onpress: () {
                        Navigator.pushNamed(context, '/listChats');
                      }),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: const Text(
                      'o crea una cuenta',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.deepPurple),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Hero(
                  tag: 'footer',
                  child: Text(
                    'Made in Colombia',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
