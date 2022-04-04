import 'package:flutter_app_chat/widgets/custombutton.dart';
import 'package:flutter_app_chat/widgets/customtextinput.dart';
import 'package:flutter/material.dart';

class ChatterSignUp extends StatefulWidget {
  const ChatterSignUp({Key? key}) : super(key: key);

  @override
  _ChatterSignUpState createState() => _ChatterSignUpState();
}

class _ChatterSignUpState extends State<ChatterSignUp> {
  late String email;
  late String password;
  late String name;
  bool signingup = false;
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
                  hintText: 'Nombre',
                  leading: Icons.text_format,
                  obscure: false,
                  userTyped: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 0,
                ),
                CustomTextInput(
                  hintText: 'Email',
                  leading: Icons.mail,
                  keyboard: TextInputType.emailAddress,
                  obscure: false,
                  userTyped: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 0,
                ),
                CustomTextInput(
                  hintText: 'Contraseña',
                  leading: Icons.lock,
                  keyboard: TextInputType.visiblePassword,
                  obscure: true,
                  userTyped: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Hero(
                    tag: 'signupbutton',
                    child: CustomButton(
                      onpress: () {
                        Navigator.pushNamed(context, '/chat');
                      },
                      accentColor: Colors.deepPurple,
                      mainColor: Colors.amber,
                      text: 'SingUp',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
