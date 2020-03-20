import 'package:flutter/material.dart';

class BackgroundTasks extends StatefulWidget {
  @override
  _BackgroundTasksState createState() => _BackgroundTasksState();
}

class _BackgroundTasksState extends State<BackgroundTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('J3 ENTERPRISE'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(Icons.wifi,color: Colors.greenAccent,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: kElevationToShadow[4]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:6.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.chevron_left,size: 36,),
                    Expanded(child: Text('Background Jobs',style: TextStyle(fontSize: 22),)),
                    Icon(Icons.stop,size: 36,color: Colors.red,),
                    Icon(Icons.sync,size: 28,),
                    Icon(Icons.file_download,size: 28,color: Colors.green,),
                    Icon(Icons.lock_open,size: 28,color: Colors.redAccent,),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 8),
                child: Text('Schedule Job',style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: kElevationToShadow[2]
                    ),
                    child: IconButton(
                      icon: Icon(Icons.alarm),
                      onPressed: () async{
                        await showTimePicker(context: context, initialTime: TimeOfDay.now());
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: kElevationToShadow[2]
                    ),
                    child: IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: ()async{
                        await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1970), lastDate: DateTime(2100));
                      },
                    ),
                  ),
                ],
              ),
            ),
            DropWid(name: 'Sync Frequency',list: 'Daily',),
            DropWid(name: 'Select Job',list: 'Getiteminformation',),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: kElevationToShadow[2]
                  ),
                  child: FlatButton(
                    child: Text('START'),
                    color: Colors.white,
                    onPressed: (){

                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: kElevationToShadow[2]
                  ),
                  child: FlatButton(
                    child: Text('Cancel'),
                    color: Colors.white,
                    onPressed: (){

                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: kElevationToShadow[2]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Running'),
                      color: Colors.white,
                      onPressed: (){

                      },
                    ),
                    FlatButton(
                      color: Colors.blue,
                      child: Text('SyncedJobs',style: TextStyle(color: Colors.white),),
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Status') ),
                  DataColumn(label: Text('Job') ),
                  DataColumn(label: Text('Date') ),
                  DataColumn(label: Text('Time') ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Started')),
                      DataCell(Text('Getiteminformation')),
                      DataCell(Text('2/6/20')),
                      DataCell(Text('13:51')),
                    ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text('Started')),
                        DataCell(Text('Getiteminformation')),
                        DataCell(Text('2/6/20')),
                        DataCell(Text('13:51')),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text('Started')),
                        DataCell(Text('Getiteminformation')),
                        DataCell(Text('2/6/20')),
                        DataCell(Text('13:51')),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text('Started')),
                        DataCell(Text('Getiteminformation')),
                        DataCell(Text('2/6/20')),
                        DataCell(Text('13:51')),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text('Started')),
                        DataCell(Text('Getiteminformation')),
                        DataCell(Text('2/6/20')),
                        DataCell(Text('13:51')),
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropWid extends StatefulWidget {

  final name,list;
  DropWid({this.name, this.list});

  @override
  _DropWidState createState() => _DropWidState();
}

class _DropWidState extends State<DropWid> {

  String selecteditem = 'None';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal:16.0),
            child: Text(widget.name,style: TextStyle(fontSize: 16),),
          ),
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal:16.0),
            child: DropdownButton(
              isExpanded: true,
              onChanged: (value){
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