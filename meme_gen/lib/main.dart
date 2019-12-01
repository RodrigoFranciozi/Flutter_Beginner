import 'package:flutter/material.dart';
import 'package:meme_gen/network_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme Generator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pun Generator'),
        centerTitle: true,
      ),
      body: Column( children: <Widget>[
        Container(
          margin: const EdgeInsets.only( top: 150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/rafao.jpeg'),
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/ric.jpeg'),
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/rod.JPG'),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Rafael', style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text(
              'Ricardo', style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text(
              'Rodrigo', style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '15.04095-0', style: TextStyle(
              fontSize: 20.0,
              color: Colors.green,
              fontFamily: 'Pacifico',
            ),
            ),
            Text(
              '15.00116-4', style: TextStyle(
              fontSize: 20.0,
              color: Colors.green,
              fontFamily: 'Pacifico',
            ),
            ),
            Text(
              '14.04014-0', style: TextStyle(
              fontSize: 20.0,
              color: Colors.green,
              fontFamily: 'Pacifico',
            ),
            )
          ],
        ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only( top: 150.0),
                  child: RaisedButton(
                    child: Text('Go to pun generation'),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PiadaPage()),
                      );
                    },
                  ),
                )

              ],
            ),
          ], //
        ),
      );
  }
}

class PiadaPage extends StatefulWidget {
  @override
  _PiadaPageState createState() => _PiadaPageState();
}

class _PiadaPageState extends State<PiadaPage> {
  String _urlPiada = "Aperte o botão";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Meme Generator'),
          backgroundColor: Colors.green,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },),
        ),
        body: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () async {
                      print("Botao apertado");
                      String busca = "https://icanhazdadjoke.com/";
                      NetworkHelper helper = NetworkHelper(url: busca);
                      var data = await helper.getData();
                      setState(() {
                        _urlPiada = data["joke"];
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    child: Text(
                      'Generate Dad Joke',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    _urlPiada,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MemePage extends StatefulWidget {
  @override
  MemePageState createState() => MemePageState();
}

class MemePageState extends State<MemePage>{

  @override
  Widget build(BuildContext context) {

    return null;
  }

}

