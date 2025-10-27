import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/trip_model.dart';

abstract class TripsLocalDataSource {
  Future<List<TripModel>> getTrips();
}

class TripsLocalDataSourceImpl implements TripsLocalDataSource {
  @override
  Future<List<TripModel>> getTrips() async {
    final jsonString = await rootBundle.loadString('assets/mock/trips_mock.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final tripsList = (jsonData['trips'] as List).map((tripJson) => TripModel.fromJson(tripJson)).toList();
    return tripsList;
  }
}
