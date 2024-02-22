import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/Page/List.dart';

import 'Page/Login.dart';
import 'Page/Register.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const task());
}
class task extends

StatelessWidget {
  const task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return(  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{ LoginPage.id:(context)=> LoginPage(),
        RegisterPage.id:(context)=>RegisterPage(),
        ListPage.id:(context)=>ListPage()
      } ,
      initialRoute:  LoginPage.id,

    ));
  }
}
