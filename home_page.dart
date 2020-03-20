import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:j3enterprise/about.dart';
import 'package:j3enterprise/btasks.dart';
import 'package:j3enterprise/profile.dart';
import 'package:j3enterprise/setup_communication.dart';
import 'package:j3enterprise/sever_setup.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pinswitch = false;
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 26,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueGrey, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SetupCommunication()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Setup Communication',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BackgroundTasks()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.sync,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Background Jobs',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LocalServer()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.disc_full,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Local Server Setup',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Language'),
                          content: DropWid('English'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            )
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        );
                      });
                },
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Language',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.announcement,
                    color: Colors.black,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/beach-background-4.jpg'),
          /* Changed here*/ fit: BoxFit.none,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Center(
                child: Image(
                  image: AssetImage('images/logo.png'),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Center(
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(240),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(71, 9, 0, 0),
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 71.0),
                                  child: Text(
                                    'Username',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )),
                            ListTile(
                                leading: Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                                title: TextField()),
                            new TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                                  icon: const Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 20, 18, 0),
                                      child: const Icon(Icons.lock))),
                              validator: (val) =>
                                  val.length < 6 ? 'Password too short.' : null,
                              onSaved: (val) => _password = val,
                              obscureText: _obscureText,
                            ),
                            new FlatButton(
                                onPressed: _toggle,
                                child:
                                    new Text(_obscureText ? "Show" : "Hide")),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(71, 9, 0, 0),
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 71.0),
                                  child: Text(
                                    'Company Code',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )),
                            ListTile(
                                leading: Icon(
                                  Icons.home,
                                  color: Colors.black,
                                ),
                                title: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                )),
                            SwitchListTile(
                              value: pinswitch,
                              onChanged: (b) {
                                setState(() {
                                  pinswitch = b;
                                });
                              },
                              title: Text(
                                'PIN',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              secondary: Icon(
                                Icons.security,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: FlatButton(
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LandingPage()));
                                },
                                child: Center(
                                    child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    width: 26,
                                    height: 26,
                                    image:
                                        AssetImage('images/google-brands.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    width: 26,
                                    height: 26,
                                    image: AssetImage('images/facebook.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    width: 28,
                                    height: 28,
                                    image: AssetImage(
                                        'images/twitter-square-brands.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                      width: 28,
                                      height: 28,
                                      image: AssetImage(
                                          'images/envelope-solid.png'),
                                      fit: BoxFit.fill),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropWid extends StatefulWidget {
  final String list;
  DropWid(this.list);

  @override
  _DropWidState createState() => _DropWidState();
}

class _DropWidState extends State<DropWid> {
  String selecteditem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton(
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              selecteditem = value;
            });
          },
          value: selecteditem,
          items: [
            DropdownMenuItem(
              child: Text('French'),
              value: 'French',
            ),
            DropdownMenuItem(
              child: Text(widget.list),
              value: widget.list,
            )
          ],
        ),
      ),
    );
  }
}
