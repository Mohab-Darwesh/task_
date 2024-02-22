import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task/model/user_model.dart';

class ListPage extends StatefulWidget {
  const ListPage ({Key? key}) : super(key: key);
  static  String id ='ListPage';

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<UserModel>ListUser=[];
  Stream<List<UserModel>> GetData(){
   return FirebaseFirestore.instance.collection("users").snapshots().map(
           (event) {


      event.docs.forEach((element) {
        if(element.exists){

          ListUser.add(UserModel.fromMap(element.data()));


          setState(() {

          });
        }
      });
return ListUser;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listpage"),),
      body: Container(
        height: 1000,
        width: 4000,
        child:StreamBuilder

          (
          stream: GetData(),
           builder:(context,s){
            return ListView.builder(
                itemCount: ListUser.length,
                itemBuilder:(cintext, i){
                  return ListTile(
                    title: Text(ListUser[i].email),
                  )  ;
                }
            );
           },
        )
      ),
    );
  }
}
