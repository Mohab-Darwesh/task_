
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/model/user_model.dart';

import '../Widgets/CustomButon.dart';
import '../Widgets/custom_textField.dart';
import 'Login.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({Key? key}) : super(key: key);
static  String id ='RegisterPage';
String? email;
String? password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("RegisterPage"),),
      backgroundColor: Colors.blueAccent,

      // backgroundColor: const Color(0xff1f65a2),
      body:Container(
decoration: const BoxDecoration(
  gradient: LinearGradient(
      colors: [
      Color(0xff1f65a2),
  Color(0xffdddee7),
  ]
)),
        padding: const EdgeInsets.symmetric(horizontal: 8),

        child: ListView(

          children:  [
            const SizedBox(height: 120,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,

                  ),),
              ],
            ),
            const SizedBox(height: 75,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Register'
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
                email=data;
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

             const SizedBox(
               height: 15,
             ),
             CustomButon(
             ontap: ()async {
         FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!, password: password!);
           _saveCredentials().then((value) {
             Navigator.pushNamed(context,LoginPage.id);
           });




             },
               text: "Register",

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

                    Navigator.pushNamed(context,LoginPage.id);
                  },
                  child: const Text(" Login",
                    style: TextStyle(color: Color(0xff1f65a2)),),
                )
              ],
            ),

            const SizedBox(height: 75,),
          ],
        ),
      ) ,
    );
  }

  void ShowSnackBar(BuildContext context , String massage) {
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.white,
          content: Text(massage,
            style: const TextStyle(
                color: Colors.black
            ),

          ),
        ),);
  }
   Future<void> _saveCredentials() async {
     try {
       // String userId = const Uuid().v1();
       UserModel user = UserModel(

           uid:FirebaseAuth.instance.currentUser!.uid,

           email:email!);


       await FirebaseFirestore.instance
           .collection('users')
           .doc(FirebaseAuth.instance.currentUser!.uid)
           .set(user.toMap());
       print('email is ${user.email}');
     } catch (e) {
       if (kDebugMode) {
         print(e);
       }
     }
   }

}
