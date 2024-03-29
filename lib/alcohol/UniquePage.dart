import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'HomePage.dart';
import 'ResultPage.dart';

class UniquePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UniquePageState();
  }
}

class UniquePageState extends State<UniquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
            title: Text('Подбор алкоголя'),
            backgroundColorStart: HomePageState.hexToColor('#000428'),
            backgroundColorEnd: HomePageState.hexToColor('#004e92')),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                HomePageState.hexToColor('#000428'),
                HomePageState.hexToColor('#004e92')
              ])),
          child: FutureBuilder<QuerySnapshot>(
            future: db
                .collection('test2')
                .where('clr',
                    isLessThan: HomePageState.preferredAmount)
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SpinKitWave(color: Colors.cyan, size: 50.0);
              }
              return ListView(
                children: getReferences(snapshot),
              );
            },
          ),
        ));
  }

//This method returns unique liquor types from Firestore
  getReferences(AsyncSnapshot<QuerySnapshot> snapshot) {
    //Add only property 'type' from all documents to temporary list
    var tempList = [];
    for (var x in snapshot.data.documents) {
      tempList.add(x.data['type']);
    }
    //Creating a new list containing unique values from temporary list
    var unique = tempList.toSet().toList();
    unique.remove('');

    //Returning ListTiles consisting of unique liquor types
    return unique
        .map((snap) => ListTile(
              title: Text(snap),
              trailing: Icon(FontAwesomeIcons.chevronRight),
              onTap: () {
                HomePageState.type = snap;
                print(HomePageState.type);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage()));
              },
            ))
        .toList();
  }
}
