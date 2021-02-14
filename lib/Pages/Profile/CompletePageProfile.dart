import 'package:e_commerce/Pages/Login/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class CompletePageProfile extends StatefulWidget {
  @override
  _CompletePageProfileState createState() => _CompletePageProfileState();
}

class _CompletePageProfileState extends State<CompletePageProfile> {
  double lat;
  double lon;
  String address;
  Position position;

  Future _determinePosition() async {
    /* bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permantly denied, we cannot request permissions.');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return Future.error(
          'Location permissions are denied (actual value: $permission).');
    }
  }*/
    position = await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 24, right: 24, bottom: 16),
              child: Text(
                "Thanks For your registration, Please Complete Your Profile:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  child: Column(
                children: [
                  CustomTextField(
                    icon: Icon(Icons.person),
                    labelText: "Your name",
                    validator: (input) =>
                        input.isEmpty ? "Please enter valid name" : null,
                  ),
                  CustomTextField(
                    icon: Icon(Icons.phone),
                    labelText: "Phone",
                    keyboardType: "number",
                    prefixText: "09",
                    validator: (input) => input.length < 10
                        ? "Please enter valid mobile number"
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Lat: ",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,fontWeight: FontWeight.w600),),
                        Text(
                          lat.toString(),
                          style: TextStyle(fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor.withOpacity(0.5)),
                        ),
                        Text("Lon: ",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,fontWeight: FontWeight.w600)),
                        Text(
                          lon.toString(),
                          style: TextStyle(fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor.withOpacity(0.5)),
                        ),
                        IconButton(
                            icon: Icon((position == null)
                                ? Icons.location_searching
                                : Icons.my_location),
                            onPressed: () {
                              _determinePosition().then((value) async {
                                final coordinates = new Coordinates(position.latitude, position.longitude);
                                var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                                print(addresses[0].postalCode);
                                print(addresses[0].locality);
                                print(addresses[0].countryCode);
                                print(addresses[0].addressLine);
                                print(addresses[0].countryName);
                                print(addresses[2].adminArea);
                                print(addresses[2].featureName);
                                print(addresses[2].subAdminArea);
                                print(addresses[2].subLocality);
                                print(addresses[2].subThoroughfare);
                                print(addresses[2].thoroughfare);


                                print(lat);
                                print(lon);
                                setState(() {
                                  lat = position.latitude;
                                  lon = position.longitude;
                                });
                              });
                            })
                      ],
                    ),
                  )
                ],
              )),
            )
          ],
        )),
      ),
    );
  }
}
