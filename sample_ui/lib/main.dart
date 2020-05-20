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
  bool select=false;

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: ListView(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(
                top: 30.0,
                left: 0.0,
                right: 15.0,
                bottom: 20.0
            ),
            child:new Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                      color: Colors.red,
                        size: 40.0,
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
                  Padding(padding: EdgeInsets.only(bottom: 15),
                      child:Text("Food Prefrences",style:TextStyle(
                    fontSize: 20.0,
                        fontWeight: FontWeight.w700
                  ))),
                  Text("jcnsdkjcskcnsdkjjcndskjcnsdkjjcncdkjcsdkcdkjcsdkcdkjcsdkcsdkjcdkjcd")
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 30.0,
                left: 15.0,
                right: 15.0,
                bottom: 20.0
            ),
            child:Container(
              child:Column(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    child: Column(
                      children: <Widget>[

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child:ButtonTheme(
                                        buttonColor: select?Colors.redAccent:Colors.white,
                                        minWidth: 150,
                                        child: RaisedButton(
                                          padding: EdgeInsets.all(12.0),
                                          elevation: 10.0,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),
                                          child: Text("onee"),
                                          onPressed: (){
                                            setState(() {
                                              select=!select;

                                            });
                                          },
                                        ),
                                      )),

                                  Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child:ButtonTheme(
                                        buttonColor: Colors.white,
                                        minWidth: 150,
                                        child: RaisedButton(
                                          padding: EdgeInsets.all(12.0),
                                          elevation: 10.0,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),
                                          child: Text("onee"),
                                          onPressed: (){

                                          },
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                      child:ButtonTheme(
                                    buttonColor: Colors.white,
                                    minWidth: 150,
                                    child: RaisedButton(
                                      padding: EdgeInsets.all(12.0),
                                      elevation: 10.0,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0)
                                      ),
                                      child: Text("onee"),
                                      onPressed: (){
                                        debugPrint(context.toString());
                                      }
                                    ),
                                  )),

                                  Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child:ButtonTheme(
                                        buttonColor: Colors.white,
                                        minWidth: 150,
                                        child: RaisedButton(
                                          padding: EdgeInsets.all(12.0),
                                          elevation: 10.0,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),
                                          child: Text("onee"),
                                          onPressed: (){

                                          },
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )


                      ],
                    ),
                  )
                ],
              )
            )
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 30.0,
                left: 15.0,
                right: 15.0,
                bottom: 20.0
            ),
            child: SizedBox(
              height: 300,
              child:CustomScrollView(

                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 4.0
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext c,int index){
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.redAccent,
                          child: Text("Grid Item $index"),
                        );
                      },
                      childCount: 10,
                    ),
                  ),
                ],
              ) ,

              ),

          )




        ],
      ),
    );
  }
}
