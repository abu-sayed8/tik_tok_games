 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_games/new_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "tic tac toe",
      theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: defaultTargetPlatform==TargetPlatform.android?Colors.white:null
      ),
      home: SafeArea(child: Homepage()),
        routes: <String,WidgetBuilder>{
          "/a":(BuildContext context) => new NewPage("New Page"),
        }
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<List> _matrix;
  _HomepageState(){
    _initMatrix();
}
_initMatrix(){
  _matrix=List<List>(3);
  for(var i=0;i<_matrix.length;i++){
    _matrix[i]=List(3);
    for(var j=0;j<_matrix[i].length;j++){
      _matrix[i][j]=' ';
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('tic toc toe'),
            elevation: defaultTargetPlatform==TargetPlatform.android?5.00:0.0,

          ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget> [
            new UserAccountsDrawerHeader(
              accountName: new Text("Abu Sayed"),
              accountEmail: new Text("saed@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).platform==TargetPlatform.android
                    ?Colors.deepPurple
                    :Colors.white,
                child: Text("S"),
              ),

              // otherAccountsPictures: <Widget>[
              //   CircleAvatar(
              //     backgroundColor: Theme.of(context).platform==TargetPlatform.android
              //         ?Colors.deepPurple
              //         :Colors.white,
              //     child: Text("P"),
              //   )
              // ],

            ),
            new ListTile(
              title: new Text("Privacy Policy"),
              trailing: new Icon(Icons.security),
              onTap: (){
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new NewPage("page")));

              },

            ),
            new ListTile(
              title: new Text("Share"),
              trailing: new Icon(Icons.share ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/a");
                //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new NewPage("page two")));
              },

            ),
            new Divider(

            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
              onTap: ()=>Navigator.of(context).pop(),

            ),
          ],
        ),
      ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildElement(0,0),
                    _buildElement(0,1),
                    _buildElement(0,2)
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildElement(1,0),
                    _buildElement(1,1),
                    _buildElement(1,2)
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildElement(2,0),
                    _buildElement(2,1),
                    _buildElement(2,2)
                  ],
                )
              ],
            ),
          ), 
    );
  }
  String _lastChar='O';
  _buildElement(int i,int j){
    return GestureDetector(
      onTap: (){
        _changeMatrixField(i,j);
        _checkWinner(i,j);
      },
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black
          )
        ),
        child: Text(
            _matrix[i][j],
          style: TextStyle(fontSize: 90.0
        ),
        ),
      ),
    );
  }
  _changeMatrixField(int i,int j){
    setState(() {
      if(_matrix[i][j]==' ')
      {
        if(_lastChar=='O')
         _matrix[i][j]='A';
        else
         _matrix[i][j]='O';
         _lastChar =_matrix[i][j];
      }
    });
  }
  _checkWinner(int x,int y){
    var col=0,row=0,diag=0,rdiag=0;
    var n=_matrix.length-1;
    var player=_matrix[x][y];
    for(var i=0;i<_matrix.length;i++){
      if(_matrix[x][i]==player)
        col++;
      if(_matrix[i][y]==player)
        row++;
      if(_matrix[i][i]==player)
        diag++;
      if(_matrix[i][n-i]==player)
        rdiag++;
    }
    if(row==n+1||col==n+1||diag==n+1||rdiag==n+1){
      print('$player won');
      _initMatrix();
    }
  }
}
