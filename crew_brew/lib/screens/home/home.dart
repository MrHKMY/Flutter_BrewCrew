import 'package:crew_brew/models/brew.dart';
import 'package:crew_brew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:crew_brew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:crew_brew/screens/home/brew_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget> [
            FlatButton.icon(
                onPressed: () async {await _auth.signOutUser();},
                icon: Icon(Icons.person), label: Text("LogOut"))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
