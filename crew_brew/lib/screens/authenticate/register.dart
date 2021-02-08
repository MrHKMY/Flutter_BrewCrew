import 'package:crew_brew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function passValue;

  Register({this.passValue});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();


  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign up to Brew Crew"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.passValue();
              },
              icon: Icon(Icons.person),
              label: Text("Sign In"))
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
                  validator: (val) => val.isEmpty ? "Enter your email" : null ,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6 ? "Password too short" : null ,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                  color: Colors.red[400],
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                      if (result == null){
                        setState(() => error = "Please add valid email");
                      }
                    }
                  }),
              SizedBox(height: 20,),
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
