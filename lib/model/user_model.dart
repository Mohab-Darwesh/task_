// ignore_for_file: public_member_api_docs, sort_constructors_first



class UserModel  {

  final String uid;

  final String email;

   UserModel({

    required this.uid,

    required this.email,

  });

  @override


  Map<String, dynamic> toMap() {
    return <String, dynamic>{

      'uid': uid,

      'email': email,

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(

      uid: map['uid'] as String,

      email: map['email'] as String,

    );
  }
}