import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _pwd;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/hplogo.png'),
                      fit: BoxFit.contain)),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // * email field
                    Container(
                      width: double.maxFinite,
                      height: 50.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.indigo)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid email.';
                          }
                        },
                        onSaved: (value) => _email = value,
                        decoration:
                            InputDecoration.collapsed(hintText: 'Email'),
                      ),
                    ),
                    Divider(),
                    // * password field
                    Container(
                      width: double.maxFinite,
                      height: 50.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.indigo)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid password.';
                          } else if (value.length <= 5) {
                            return 'Please enter a password with at least 6 characters';
                          }
                        },
                        onSaved: (value) => _pwd = value,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password',
                        ),
                        obscureText: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign In'),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: newUser,
              child: Text('Add user'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> newUser() async {
    final formState = _formKey.currentState;

    formState.save();
    if (formState.validate()) {
      try {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _pwd);
        Navigator.pushNamed(context, '/register');
      } catch (e) {
        print(e.message);
      }
    }
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      // * use firebase to validate
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pwd);
        Navigator.pushNamed(context, '/home');
      } catch (e) {
        print(e.message);
      }
    }
  }
}
