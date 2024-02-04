import 'package:firebase_database/firebase_database.dart';
import 'package:project_iot/networks/data_base/readData.dart';
import 'package:project_iot/networks/data_base/write_data.dart';
import 'package:project_iot/networks/models/appliance_model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  HomeViewModel(this._write,this._read);
  final WriteData _write;
  final ReadData _read;

  // bool swiped = false;
  Stream<DatabaseEvent> get event => _read.readData();

  List<ApplianceModel> appliances = [
    ApplianceModel(
      unit: 'volts',
      type: 'AC input voltage',
      value: 220,
      image: 'logo_icon'
    ),
    ApplianceModel(
      unit: 'volts',
      type: 'AC output voltage',
      value: 140,
        image: 'logo_icon'
    ),
    ApplianceModel(
      unit: '°C',
      type: 'Temperature',
        image: 'temperature',
      value: 33
    ),

  ];
  // void toggleInverter() {
  //
  //   notifyListeners();
  // }

  Future<void> toggleInverter(bool? value) async {
    // if(value!=null){
      await runBusyFuture(_write.writeData((value??false))).then((value) {
        // swiped = !swiped;
      });
    // }


  }
}