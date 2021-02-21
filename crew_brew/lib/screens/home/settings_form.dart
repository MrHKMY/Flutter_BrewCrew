import 'package:flutter/material.dart';
import 'package:crew_brew/shared/constant.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              "Update Your Brew Preferences.",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? "Please enter a name" : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              value: _currentSugars ?? "0",
              onChanged: (val) {
                setState(() => _currentSugars = val);
              },
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text("$sugar sugars"),
                );
              }).toList(),
            ),
            //dropdown
            //slider
            RaisedButton(
                color: Colors.red,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                }),
          ],
        ));
  }
}