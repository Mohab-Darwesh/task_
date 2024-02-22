
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/Page/List.dart';
import 'package:task/Page/Register.dart';

import '../Widgets/CustomButon.dart';
import '../Widgets/custom_textField.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
static String id ='loginpage';
static String? password;
   static String? Email;
  @override
  Widget build(BuildContext context) {
    return (
    Scaffold(
      appBar: AppBar(title: const Text("LoginPage"),),

     // backgroundColor: const Color(0xff1f65a2),
      body:Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1f65a2),
                Color(0xffdddee7),

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),

        child: Column(

          children:  [
            const Spacer(flex: 1,),

           const Text('Task',
           style: TextStyle(
             fontSize: 32,
             color: Colors.white,

           ),),
            const Spacer(flex: 1,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('LOGIN'
                ,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),),
              ],
            ),
            const SizedBox(
              height: 15,

            ),
             CustomTextField(
               onChanged: (data){
                 Email=data;
               },
               hintText: " Email",
             ),
            const SizedBox(
              height: 15,

            ),
            CustomTextField(
              onChanged: (data){
                 password=data;
              },
              hintText: " Password" ,
            ),
            const SizedBox(
              height: 15,

            ),
             CustomButon(
               text: 'Login',
               ontap: ()async{
                     FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: Email!, password: password!);
                   Navigator.pushNamed(context,ListPage.id);


               },
             ),
const SizedBox(
  height: 15,

),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                const Text("dont/'t have account ? ",
                style:TextStyle(
                  color: Colors.white
                )
                  ,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return  RegisterPage();
                        }));
                  },
                  child: const Text(" Register",
                  style: TextStyle(color: Color(0xff1f65a2)),),
                )
              ],
            ),

             const Spacer(flex: 3,),
          ],
        ),
      ) ,
    )
    )
    ;
  }
}
