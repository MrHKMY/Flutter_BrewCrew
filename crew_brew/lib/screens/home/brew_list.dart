import 'package:crew_brew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];
    //print(brews);
    // for (var doc in brews.documents) {
    //   print(doc.data);
    // }

    brews.forEach((element) {
      print(element.name);
      print(element.sugars);
      print(element.strength);
    });

    return Container();
  }
}
