import 'package:flutter/material.dart';

class LocalServer extends StatefulWidget {
  @override
  _LocalServerState createState() => _LocalServerState();
}

class _LocalServerState extends State<LocalServer> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: kElevationToShadow[4]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    size: 36,
                  ),
                  Expanded(
                      child: Text(
                    'Server Setup',
                    style: TextStyle(fontSize: 22),
                  )),
                  Icon(
                    Icons.stop,
                    size: 36,
                    color: Colors.red,
                  ),
                  Icon(
                    Icons.sync,
                    size: 28,
                  ),
                  Icon(
                    Icons.file_download,
                    size: 28,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.lock_open,
                    size: 28,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ),
          DropWid(
            name: 'Server Name',
            list: 'ERP Next',
          ),
          NormWid(name: 'Database Name', type: 'u'),
          NormWid(name: 'SQL Username', type: 'u'),
          NormWid(name: 'SQL Password', type: 'p'),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Connection Timeout: '),
              ),
              Expanded(
                child: Slider(
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      value = val;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ButtonTheme(
                height: 45,
                child: FlatButton(
                  color: Colors.lightGreen,
                  onPressed: () {},
                  child: Center(
                      child: Text(
                    'Save Changes',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ButtonTheme(
                height: 45,
                child: FlatButton(
                  color: Colors.orange,
                  onPressed: () {},
                  child: Center(
                      child: Text(
                    'Test',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ButtonTheme(
                height: 45,
                child: FlatButton(
                  color: Colors.red,
                  onPressed: () {},
                  child: Center(
                      child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              )),
        ],
      ),
    );
  }
}

class DropWid extends StatefulWidget {
  final name, list;
  DropWid({this.name, this.list});

  @override
  _DropWidState createState() => _DropWidState();
}

class _DropWidState extends State<DropWid> {
  String selecteditem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.name),
          ),
          Padding(
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
                  child: Text('None'),
                  value: 'None',
                ),
                DropdownMenuItem(
                  child: Text(widget.list),
                  value: widget.list,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NormWid extends StatelessWidget {
  final name, type;
  NormWid({this.name, this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(name),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              obscureText: (type == 'u') ? false : true,
            ),
          )
        ],
      ),
    );
  }
}
