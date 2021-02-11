import 'package:crew_brew/services/auth.dart';
import 'package:crew_brew/shared/constant.dart';
import 'package:crew_brew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function passValue;

  SignIn({this.passValue});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign in to Brew Crew"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.passValue();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (val) => val.isEmpty ? "Enter an email" : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? "Enter a password 6+ characters long"
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                  color: Colors.red[400],
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = "Please enter a valid email";
                          loading = false;
                        });
                      }
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
