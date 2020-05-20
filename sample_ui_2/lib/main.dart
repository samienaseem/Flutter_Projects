import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  bool s=false;
  List<bool> _selected=List.generate(12, (i)=>false);
  List<String> _buton;
  List<String> _sitems=new List();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  top: 30.0,
                  left: 15.0,
                  right: 15.0,
                  bottom: 20.0
              ),
              child:new Container(
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.red,
                        size: 50.0,
                      ),
                    )
                  ],
                ),
              )
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 10.0,
                left: 15.0,
                right: 15.0,
                bottom: 20.0
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child:Text("Food Prefrences",style:TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                      )
                      )
                  ),
                  Text("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsds",
                    textDirection:
                    TextDirection.ltr,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16.0
                    ),

                  )
                ],
              ),
            ),
          ),

          Padding(
              padding: EdgeInsets.only(
                  top: 10.0,
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0
              ),
              child:SizedBox(
                height: 300,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          childAspectRatio: 4.0
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext c,int index){
                          return ButtonTheme(
                            buttonColor: _selected[index]?Colors.redAccent:Colors.white,

                            child: RaisedButton(
                              padding: EdgeInsets.all(12.0),
                              elevation: 2.0,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)
                              ),
                              child: Text(_buton[index],
                                style: TextStyle(
                                  color: _selected[index]?Colors.white:Colors.black
                                ),),
                              onPressed: (){

                                setState(() {
                                  _selected[index]=!_selected[index];
                                  if(_selected[index]==true){
                                    _sitems.add(_buton[index]);
                                    debugPrint(_sitems.toString());

                                  }
                                  else{
                                    _sitems.remove(_buton[index]);
                                    debugPrint(_sitems.toString());
                                  }

                                });
                              },
                            ),
                          );
                        },
                        childCount: _buton.length,
                      ),

                    )
                  ],
                ),
              )

            /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
          ),

          Align(
            alignment: Alignment.bottomCenter,
              child:Padding(
            padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RawMaterialButton(
                    elevation: 0.0,
                    fillColor: Colors.redAccent,
                    onPressed: (){

                    },
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 60,
                    )
                  ),

                  Padding(padding: EdgeInsets.all(10.0),
                      child:Text("Skip this step"))
                ],

              ),

          ))
        ],
      )

    );
  }

  @override
  void initState() {

    _buton=new List();
    _buton.add("VEG");
    _buton.add("North Indian");
    _buton.add("NON-VEG");
    _buton.add("South Indian");
    _buton.add("Quick Snaks");
    _buton.add("Pizzas");
    _buton.add("A");
    _buton.add("B");
    _buton.add("C");
    _buton.add("D");
    _buton.add("E");
    _buton.add("F");
  }
}
