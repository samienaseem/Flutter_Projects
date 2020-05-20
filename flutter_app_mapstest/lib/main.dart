import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Maps Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  GoogleMapController _controller;
  Circle circle;
  Marker marker;
  LocationData locationGlobal;
  static const LatLng _center = const LatLng(22.00, 77.00);
  final Set<Marker> _marker = {};
  LatLng lastMappost = _center;
  MapType _currentmapType = MapType.normal;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Geocoder geocoder;
  Address first1;
  String add;
  TextEditingController searchController;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: <Widget>[
            GoogleMap(
              compassEnabled: true,
              circles: Set.of((circle!=null)?[circle]:[]),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentmapType,
              markers: Set.of((marker != null) ? [marker] : []),
              onCameraMove: _onCameraMove,
            ),
            Positioned(
              top: 30,
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(1.0,5.0)
                    )
                  ]
                ),
                child: TextFormField(
                  autofocus: false,

                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: searchandnavigate,
                    ),
                    hintText: 'Destination',
                    hintStyle: TextStyle(
                    ),
                    contentPadding: EdgeInsets.only(top: 15.0),
                    prefixIcon: Icon(Icons.location_on),

                  ),
                  onChanged: (val){
                    setState(() {
                      add=val;
                      debugPrint(val);
                    });

                  },
                ),
              ),
            ),

            /*Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: <Widget>[
                    button(_onmapTypeButtonPressed, Icons.map),
                    SizedBox(height: 16.0,),
                    //button(_onAddMarkerButtonPresed, Icons.add_location),


                  ],
                ),
              ),

            ),*/
            /*Padding(
              padding: EdgeInsets.all(5.0),
                child:Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(first1==null?"hello" : "",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    backgroundColor: Colors.black,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),),
                )
            )*/
            /*Padding(
             padding: EdgeInsets.all(10.0),
             child: Align(
               //alignment: Alignment.bottomLeft,
               child: Column(
                 //crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   button(_getCurrentLocation, Icons.my_location),
                   SizedBox(height: 20.0,),
                 ],
               ),
             ),
           )*/
          ],

        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _getCurrentLocation,
          tooltip: 'Location',
          child: Icon(Icons.my_location),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller=controller;
  }

  void _onCameraMove(CameraPosition position) {
    lastMappost = position.target;
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
        onPressed: function,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.blue,
        child: Icon(
          icon,
          size: 25.0,

        )

    );
  }

  _onmapTypeButtonPressed() {
    setState(() {
      _currentmapType = _currentmapType == MapType.normal
          ? MapType.hybrid
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPresed() {
    setState(() {
      _marker.add(Marker(
          markerId: MarkerId(lastMappost.toString()),
          position: lastMappost,
          infoWindow: InfoWindow(
              title: "This is title",
              snippet: "This is snippet"
          ),
          icon: BitmapDescriptor.defaultMarker
      ));
    });
  }

  void _getCurrentLocation() async {
    try {
      Uint8List imagedata= await getMarker();
      var location = await _locationTracker.getLocation();



      setState(() {
        //first1=adress.first;
        locationGlobal=location;
      });





      debugPrint(location.toString() + "::Hello11110000");
      UpdateCircle(location,imagedata);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
            if (_controller != null) {
              _controller.animateCamera(CameraUpdate.newCameraPosition(
                new CameraPosition(
                    target: LatLng(
                        newLocalData.latitude, newLocalData.longitude),
                    bearing: 192.8334901395799,
                    tilt: 0,
                    zoom: 18.00
                ),

              ));
              UpdateCircle(location,imagedata);
            }
          }
          );
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  void UpdateCircle(LocationData location,Uint8List imageData) async{
    final cordinates=new Coordinates(location.latitude, location.longitude);
    var adress=await Geocoder.local.findAddressesFromCoordinates(cordinates);


    debugPrint(adress.first.addressLine);

    debugPrint("one11");
      LatLng latLng=LatLng(location.latitude,location.longitude);
      this.setState(() {

        marker=Marker(
          markerId: MarkerId("CP"),
          zIndex: 2,
          icon: BitmapDescriptor.fromBytes(imageData),
          draggable: false,
          flat: true,
          infoWindow: InfoWindow(
            title: "Address",
            snippet:adress.first.addressLine
          ),
          position: latLng,
          anchor: Offset(0.5, 0.5),
          rotation: location.heading

        );

        circle=Circle(
            circleId:CircleId("Marker"),
            center: latLng,
            fillColor:Colors.blue.withAlpha(70),
            radius:location.accuracy,
            strokeColor: Colors.transparent,
            zIndex: 1,
            /*onTap: (){
              debugPrint(location.altitude.toString());
            }*/
        );
      });



  }

  Future<Uint8List> getMarker() async{

    ByteData byteData=await DefaultAssetBundle.of(context).load("assets/markerPositionCurrent.png");
    return byteData.buffer.asUint8List();

  }

  void searchandnavigate() {
    locationGlobal=null;
    _locationSubscription=null;
    _locationTracker=null;

    Geolocator().placemarkFromAddress(add).then((result){
      _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
         target: LatLng(result[0].position.latitude,result[0].position.longitude),
         zoom: 10.0,

        )

      ));
    });

  }
}
