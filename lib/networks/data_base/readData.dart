import 'package:firebase_database/firebase_database.dart';

class ReadData{
  final dbRef = FirebaseDatabase.instance.ref();
  Stream<DatabaseEvent> readData() {
    return dbRef.child("alabivictor015").onValue;
    // return dbRef.child("BatteryLevel/level").onValue;
  }

}