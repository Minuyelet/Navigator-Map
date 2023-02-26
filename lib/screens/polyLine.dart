import 'dart:async';

import 'package:bitnavigatormap/helpers/location_helpers.dart';
// import 'package:bitnavigatormap/screens/listOfBuildings.dart';
// import 'package:bitnavigatormap/screens/listOfFaculity.dart';
// import 'package:bitnavigatormap/screens/listOfOffices.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';






// ignore: camel_case_types
class polyLineplaces extends StatelessWidget {
  // const polyLineplaces({super.key});
  //  final namex attributes;
  // const polyLineplaces(this.attributes, {super.key});


  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'ghfg');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? mapController;







  // final LatLng _center = const LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController=controller;

  // }
final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static  final CameraPosition _kGooglePlex = CameraPosition(

    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};






      static Position?position;


    Future<void> getMyCurrentLocation() async{
      await LocationHelper.getCurrentLocation();
      position = await Geolocator.getLastKnownPosition().whenComplete(() {
        setState(() {


        });
      });
    }

     Future<void> gotoMyCurrentLocation() async{
     final GoogleMapController controller=await _controller.future;
     controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));

  }

@override
void initState(){
  super.initState();
  getMyCurrentLocation();


}





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
       color: Colors.orange,
        ),
        backgroundColor: Colors.white,
        title: const TextField(


          style: TextStyle(
                    color:Colors.black45,
                  ),

                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.arrow_back,color: Colors.orange,),
                    // suffixIcon: Icon(Icons.close,color: Colors.orange,) ,
                    hintText: "search...",

                    hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    border: InputBorder.none,


                  ),



        ),
         shape: const RoundedRectangleBorder (
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
             ),
      ),


      body:
        position !=null ?
        GoogleMap(
        mapType: MapType.satellite                        ,
        // markers: {_kGooglePlexMarker},
        // polylines: {_kpolyline},
        // polygons: {_kpolygon},
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

      )
      :Center(
        child: Container(
          child: CircularProgressIndicator(color: Colors.orange,),
        ),

       ),








    );

      // FloatingActionButton: Container(
      //   margin: EdgeInsets.fromLTRB(0, 0, 8,30),
      //   child: const FloatingActionButton(
      //     backgroundColor: Colors.orange,

      //     onPressed: () { gotoMyCurrentLocation(); },
      //     child: Icon(Icons.place,color: Colors.orange,),
      //   ),);
  }
}



// class homepage extends StatelessWidget {
//   homepage({super.key});
//      GoogleMapController? mapController;

//   final LatLng _center = const LatLng(45.521563, -122.677433);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController=controller;

//   }
// final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);




//   @override
//   Widget build(BuildContext context) {
//     return Stack(


//       children: [
//         GoogleMap(
//         mapType: MapType.hybrid,
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },

//       ),
//       Container(
//         child: (
//          Row(
//           //  scrollDirection: Axis.horizontal,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 8, 8, 650),
//               child: InkWell(
//                 onTap: ()
//                   {
//                     Navigator.push( context,MaterialPageRoute(
//               builder: (context) => homepage2(),
//             )
//             );
//                   }
//                 ,
//                 child: Container(
//                   width: 110,
//                   height: 30,

//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100),
//                   child:const Center(child:Text('Buildings',style: TextStyle(fontSize: 15,color:Colors.black26,decoration: TextDecoration.none ),))
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 8, 8, 650),
//               child: InkWell(
//                 onTap: ()
//                      {
//                       Navigator.push( context,MaterialPageRoute(
//               builder: (context) => const listOfOffices(),
//             )
//             );
//                      }
//                 ,
//                 child: Container(

//                   width: 110,
//                   height: 30,

//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100),
//                   child:const Center(child:Text('Offices',style: TextStyle(fontSize: 16,color:Colors.black26,decoration: TextDecoration.none),))
//                 ),
//               ),
//             ),
//              Padding(
//               padding: const EdgeInsets.fromLTRB(15, 8, 8, 650),
//               child: InkWell(
//                 onTap: ()
//                     {
//                       Navigator.push( context,MaterialPageRoute(
//               builder: (context) => const listOfFaculity(),
//             )
//             );
//                     }





//                 ,
//                 child: Container(
//                   width: 110,
//                   height: 30,

//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100),
//                   child:const Center(child:Text('Faculity',style: TextStyle(fontSize: 16,color:Colors.black26,decoration: TextDecoration.none ),))
//                 ),
//               ),
//             ),

//           ],

//          )
//         ),
//       )
//       ]
//     );
//   }
// }