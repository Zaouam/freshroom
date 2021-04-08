import 'package:flutter/material.dart';
import 'package:fresh_room/Home.dart';
import 'SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  final User user;

  const SignIn({Key key, this.user}) : super(key: key);
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isHidden = false;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
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
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isHidden
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            fillColor: Colors.white,
                          ),
                          obscureText: _isHidden,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () => (MaterialPageRoute(
                                builder: (context) => SignIn())),
                            child: Text(
                              'Forgot you credential',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.red,
                            child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  _signInWithEmailAndPassword();
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
                          'Don\'t have an account ?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          ),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ]))),
        )));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Home(
          user: user,
        );
      }));
    } catch (e) {
      print("Failed to sign in with Email & Password");
    }
  }
}
