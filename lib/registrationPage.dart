// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

String username = '';
String password = '';
String role = '';
bool show = false;
String public_key_driver = '';
bool formCompleted = false;
late String phone;

class _RegistrationPageState extends State<RegistrationPage> {
  void validateForm() {
    if (username.length != 0 && password.length > 5) {
      formCompleted = true;
    } else {
      formCompleted = false;
    }
  }

  bool signupObscure = true;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        color: Color.fromRGBO(255, 114, 94, 1),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .05,
                    right: MediaQuery.of(context).size.width * .05),
                child: Column(
                  children: [
                    // HeadClipper(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            TextField(
                              onChanged: (val) {
                                username = val;
                                setState(() {
                                  validateForm();
                                });
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration: customBoxStyle.copyWith(
                                  hintText: 'Enter your e-mail id'),
                            ),
                            const SizedBox(height: 15.0),
                            Text('Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            TextField(
                              onChanged: (val) {
                                password = val;
                                setState(() {
                                  validateForm();
                                });
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              obscureText: signupObscure,
                              decoration: customBoxStyle.copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye,
                                        color: Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        signupObscure = signupObscure == true
                                            ? false
                                            : true;
                                      });
                                    },
                                  ),
                                  hintText: 'Minimum 6 characters requires'),
                            ),
                            SizedBox(height: 15.0),
                            Text('Phone Number',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            TextField(
                              onChanged: (val) {
                                password = val;
                                setState(() {
                                  validateForm();
                                });
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              obscureText: signupObscure,
                              decoration: customBoxStyle.copyWith(
                                  hintText: 'Enter your phone number'),
                            ),
                            Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formCompleted) {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    try {
                                      // final newUser = await _auth.createUserWithEmailAndPassword(email: username, password: password);
                                      // if(newUser != null){
                                      Navigator.pushNamed(
                                          context, '/dashboard');
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      // }
                                    } catch (e) {
                                      print(e);
                                    }
                                  } else {
                                    null;
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Color.fromRGBO(255, 114, 94, 1),),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ))),
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            )),
                          ]),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
