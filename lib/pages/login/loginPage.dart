import 'package:e_commerce/pages/login/CustomTextField.dart';
import 'package:e_commerce/services/appLocal.dart';
import 'package:e_commerce/services/languageService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int pageIndex = 0;
  String _email;
  String _password;
  bool _loading = false;
  bool _autoValidate = false;
  String errorMsg = "";


  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();



  void switchPage() {
    if (pageIndex == 0)
      pageIndex = 1;
    else
      pageIndex = 0;
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return getLang(context, "emailRequired");
    if (!regex.hasMatch(value))
      return getLang(context, "validEmail");
    else
      return null;
  }

  void _validateLoginInput() async {

     final FormState form = _loginFormKey.currentState;
     if (_loginFormKey.currentState.validate()) {
    form.save();
     setState(() {
      _loading = true;
     });

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "user-not-found":
          {
            setState(() {
              errorMsg = getLang(context, "userNotFound");
              _loading = false;
            });
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        case "wrong-password":
          {
            setState(() {
              errorMsg = getLang(context, "wrongPassword");
              _loading = false;
            });
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errorMsg),
                    ),
                  );
                });
          }
          break;
        default:
          {
            setState(() {
              errorMsg = "";
            });
          }
      }

    }
     } else {
          setState(() {
            _autoValidate = true;
          });
        }
  }

  void _validateRegisterInput() async {
    final FormState form = _registerFormKey.currentState;
    if (_registerFormKey.currentState.validate()) {
      form.save();
      setState(() {
        _loading = true;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password
        );
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case 'email-already-in-use':
            {
              setState(() {
                errorMsg = getLang(context, "emailAlreadyInUse");
                _loading = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text(errorMsg),
                      ),
                    );
                  });
            }
            break;
          case 'weak-password':
            {
              setState(() {
                errorMsg = getLang(context, "weakPassword");
                _loading = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text(errorMsg),
                      ),
                    );
                  });
            }
            break;
        }
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.white,
          backgroundColor: Color(0xffF7F7F7),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actionsIconTheme: IconThemeData(color: Color(0xff6990B9)),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.language,
                  color: Color(0xff6990B9) /* Color(0xff6990B9)*/,
                ),
                onPressed: () {
                  setState(() {
                    changeDefaultLang(context);
                  });
                },
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Image(
                      image: AssetImage('assets/images/loginLogo.png'),
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                  ),
                  IndexedStack(
                    index: pageIndex,
                    children: [
                      /*login(context),*/
                      Container(
                        child: Form(
                            key: _loginFormKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              children: [
                                CustomTextField(
                                  icon: Icon(Icons.email),
                                  labelText: getLang(context, "email"),
                                  validator: emailValidator,
                                  onSaved: (input) => _email = input,
                                ),
                                CustomTextField(
                                  icon: Icon(Icons.lock),
                                  labelText: getLang(context, "password"),
                                  obsecure: true,
                                  validator: (input) => input.isEmpty
                                      ? getLang(context, "passwordRequired")
                                      : null,
                                  onSaved: (input) => _password = input,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: RaisedButton(
                                    onPressed: () => _validateLoginInput(),
                                    child: Text(
                                      getLang(context, "Login"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                  ),
                                )
                              ],
                            )),
                      ),
                      Container(
                        child: Form(
                            key: _registerFormKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              children: [
                                CustomTextField(
                                  icon: Icon(Icons.email),
                                  labelText: getLang(context, "email"),
                                  validator: emailValidator,
                                  onSaved: (input) => _email = input,
                                ),
                                CustomTextField(
                                  icon: Icon(Icons.lock),
                                  labelText: getLang(context, "password"),
                                  obsecure: true,
                                  validator: (input) => input.length < 8
                                      ? getLang(context, "weakPassword")
                                      : null,
                                  onSaved: (input) => _password = input,
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.5,
                                  child: RaisedButton(
                                    onPressed: () => _validateRegisterInput(),
                                    child: Text(
                                      getLang(context, "Create account"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(30.0)),
                                  ),
                                )
                              ],
                            )),
                      )],
                  ),
                  Text(
                    "${getLang(context, pageIndex == 1 ? "Already have an account" : "Don't have an account")}",
                    style: TextStyle(color: Color(0xff6990B9).withOpacity(0.8)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 64),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            switchPage();
                          });
                        },
                        child: Text(
                          "${getLang(context, pageIndex == 1 ? "Login here" : "Register here")}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6990B9)),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
