import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproject/Database/dataInf.dart';
import 'package:sampleproject/auth/auth.dart';
import 'package:sampleproject/screens/accountScreen.dart';
import 'package:sampleproject/screens/homeScreen.dart';
import 'package:sampleproject/toolsUtilites.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

//للثوابت
enum AuthMode {
  SignUp,
  Login,
}

class _AuthScreenState extends State<AuthScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //لحتى ياخدو مباشرة ع الساين اب
  AuthMode authMode = AuthMode.SignUp;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'userName': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          authMode == AuthMode.SignUp ? "Sign Up  " : 'Log In',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Toolsutilites.mainColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (authMode == AuthMode.SignUp)
                      TextFormField(
                        onSaved: (val) {
                          _authData['userName'] = val as String;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "username can't to be larger than 100 letter";
                          }
                          if (val.length < 2) {
                            return "username can't to be less than 2 letter";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter Your username ',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 10,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    TextFormField(
                      onSaved: (val) {
                        _authData['email'] = val as String;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "email can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "email can't to be less than 2 letter";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter Your Email ',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onSaved: (val) {
                        _authData['password'] = val as String;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "password can't to be larger than 100 letter";
                        }
                        if (val.length < 4) {
                          return "password can't to be less than 4 letter";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(authMode == AuthMode.SignUp
                              ? "If you already have an account, just login   "
                              : 'If you don\'t have an account already then  '),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authMode == AuthMode.Login
                                    ? authMode = AuthMode.SignUp
                                    : authMode = AuthMode.Login;
                              });
                            },
                            child: Text(
                              "click Here",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: MyButton(
                        color: Toolsutilites.mainColor,
                        title:
                            authMode == AuthMode.SignUp ? "Sign Up " : 'Log In',
                        onPressed: _submit,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      return;
    } else {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
    }
    //الشاريد بتخزن البيانات بالداتا بس مساحتها خفيفة

    SharedPreferences s1 = await SharedPreferences.getInstance();
    try {
      if (authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'] as String,
          _authData['password'] as String,
        );
//لحتى يحفظ المعلومات بالليست اللي فوق
        var x = Provider.of<Auth>(context, listen: false).addNewUser;
        print('================== ${x[0].Id}');

        ////////////////////////

        //هي بتتخزن داخل الشاريد
        s1.setString('key', '${x[0].Id}');
        //التحقق اذا مسجل دخول او لا
        s1.setBool('fetch', true);
        /////////////////////
        ///
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage(
                  IdKey: x[0].Id,
                )),
          ),
        );
      } else {
        await Provider.of<Auth>(context, listen: false).signUp(
          _authData['email'] as String,
          _authData['password'] as String,
        );
        var x = Provider.of<Auth>(context, listen: false).addNewUser;
        print('================== ${x[0].Id}');

        ////////////////
        ////////////////////////////////////
        ///////////
        s1.setString('key', '${x[0].Id}');
        s1.setBool('fetch', true);
        ///////////////////////
        //////////
        ///

        ///
        ////

        ///
        ///لحتى يحفظ البيانات بالفاير

        await FirebaseFirestore.instance
            .collection('Users')
            .doc('${x[0].Id}')
            .collection('userInf')
            .add({
          'userName': _authData['userName'],
          'email': _authData['email']!,
          'password': _authData['password']!,
        });

        for (int i = 0; i < productList.length; i++) {
          await FirebaseFirestore.instance
              .collection('Users')
              .doc('${x[0].Id}')
              .collection('favorite')
              .doc('${i}')
              .set({'id': ''});
        }
        ////
        ////
        ///
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage(
                  IdKey: x[0].Id,
                )),
          ),
        );
      }
    } catch (error) {
      var errorMessage = 'Authentication Faild';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      AwesomeDialog(
          context: context,
          title: "Error",
          body: Text("${errorMessage}", style: TextStyle(fontSize: 15)))
        ..show();
    }
  }
}
