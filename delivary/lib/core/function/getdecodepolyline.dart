import 'dart:convert';
import 'package:delivary/core/constant/color.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;




Future<Set<Polyline>> getPolyline(lat, long, destlat, destlong) async {
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineset = {};

  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=YOUR_GOOGLE_MAPS_API_KEY";

  try {
    var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);

      if (responsebody['routes'] != null &&
          responsebody['routes'].isNotEmpty &&
          responsebody['routes'][0]['overview_polyline'] != null) {

        var point = responsebody['routes'][0]['overview_polyline']['points'];
        List<PointLatLng> result = polylinePoints.decodePolyline(point);

        if (result.isNotEmpty) {
          for (var pointLatLng in result) {
            polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
          }

          Polyline polyline = Polyline(
            polylineId: PolylineId("yazan"),
            color: AppColor.red,
            width: 5,
            points: polylineco,
          );

          polylineset.add(polyline);
        }
      } else {
        print("⚠️ No routes found in the response.");
      }
    } else {
      print("❌ Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("❌ Error getting polyline: $e");
  }

  return polylineset;
}

