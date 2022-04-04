import 'package:flutter_app_chat/views/catterScreen/chatterScreen_bloc.dart';
import 'package:flutter_app_chat/views/home/home_bloc.dart';
import 'package:flutter_app_chat/views/list_chats/list_chats_bloc.dart';
import 'package:flutter_app_chat/views/list_chats/list_chats_view.dart';
import 'package:flutter_app_chat/views/login/login_bloc.dart';
import 'package:flutter_app_chat/views/login/login_view.dart';
import 'package:flutter_app_chat/views/signup/signup_bloc.dart';
import 'package:flutter_app_chat/views/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat/views/catterScreen/chatterScreen_view.dart';
import 'package:provider/provider.dart';
import 'views/home/home_view.dart';

void main() => runApp(ChatterApp());

class ChatterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatterHomeBloc()),
        ChangeNotifierProvider(create: (_) => ChatterScreenBloc()),
        ChangeNotifierProvider(create: (_) => ChatterSignUpBloc()),
        ChangeNotifierProvider(create: (_) => ChatterLoginBloc()),
        ChangeNotifierProvider(create: (_) => ListChatsBloc()),
      ],
      child: Home(),
    );

    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Nicolas Poveda',
    //   theme: ThemeData(
    //     textTheme: TextTheme(
    //       bodyText1: TextStyle(
    //         fontFamily: 'Poppins',
    //       ),
    //     ),
    //   ),
    //   initialRoute: '/',
    //   routes: {
    //     '/': (context) => ChatterHome(),
    //     '/login': (context) => ChatterLogin(),
    //     '/signup': (context) => ChatterSignUp(),
    //     '/chat': (context) => ChatterScreen(
    //           mess: [],
    //         ),
    //   },
    // );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chat app',
      theme: ThemeData(
        textTheme: TextTheme(bodyText1: TextStyle(fontFamily: 'Poppins')),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ChatterHome(),
        '/login': (context) => ChatterLogin(),
        '/signup': (context) => ChatterSignUp(),
        '/listChats': (context) => ListChats(),
      },
    );
  }
}
