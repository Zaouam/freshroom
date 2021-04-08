import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget singlesocial({String image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              image,
            ),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
            child: Form(
                key: _formKey,
                child: Container(
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          new Padding(padding: EdgeInsets.only(top: 70.0)),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: singlesocial(
                                image:
                                    'http://allianceforinterracialdignity.org/Icon_12-512.png'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Welcome Back!',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Enter your credentials to continue',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                              child: Row(children: <Widget>[
                            singlesocial(
                                image:
                                    'https://1000logos.net/wp-content/uploads/2016/11/fb-logo.jpg'),
                            singlesocial(
                                image:
                                    'https://www.droid-life.com/wp-content/uploads/2015/09/new-google-logo.jpg'),
                          ])),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _displayName,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  prefixIcon: Icon(Icons.person),
                                  fillColor: Colors.white,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                ),
                              ),
                              TextFormField(
                                controller: _passwordController,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: Icon(Icons.visibility),
                                  prefixIcon: Icon(Icons.lock),
                                  fillColor: Colors.white,
                                ),
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                          });
                                        },
                                        activeColor: Colors.green,
                                      ),
                                      InkWell(
                                        onTap: () => (MaterialPageRoute(
                                            builder: (context) => SignUp())),
                                        child: Text(
                                          'I agree with Terms of use',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 30.0),
                              Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: Colors.red,
                                  child: InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        _registerAccount();
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          )),
                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Already have an account ?',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 5.0),
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn())),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                ]))))));
  }

  void _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: _displayName.text);
      final user1 = _auth.currentUser;
      userSetup(_displayName.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SignIn(
                user: user1,
              )));
    }
  }
}
