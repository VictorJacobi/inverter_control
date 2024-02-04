import 'package:firebase_database/firebase_database.dart';

class WriteData {
  final dbRef = FirebaseDatabase.instance.ref();
  Future<void> writeData(bool value) async{
    await dbRef.child("/alabivictor015/lightState").set({"switch": !value});
  }

}