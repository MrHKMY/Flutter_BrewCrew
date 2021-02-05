import 'package:crew_brew/models/user.dart';
import 'package:crew_brew/screens/authenticate/authenticate.dart';
import 'package:crew_brew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final pengguna = Provider.of<TheUser>(context);
    //print(pengguna);
    
    //return home or authenticate
    if(pengguna == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
