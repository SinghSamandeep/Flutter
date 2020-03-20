import 'package:flutter/material.dart';
import 'package:j3enterprise/preferences.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00008b),
      appBar: AppBar(
        title: Text('J3 ENTERPRISE'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(
              Icons.wifi,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: kElevationToShadow[4]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 36,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    'About',
                    style: TextStyle(fontSize: 22),
                  )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Preferences()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: kElevationToShadow[4]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.settings,size: 40,color: Colors.white,),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Preferences',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
