import 'dart:developer';
import 'dart:math' as math;

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
  final double minimumBatteryLevel = 20.0;
  final double maximumBatteryLevel = 28.5;
  final double B = 3470.0;  // Beta value of the NTC thermistor
  final double R0 = 5000.0;  // Resistance at reference temperature (usually 25°C)
  final double R1 = 10000.0;  // Resistance at reference temperature (usually 25°C)
  final double R_Series = 10000.0;  // Series resistor connected to the thermistor
  final double T1 = 298.15;
  final double e = 2.718281828;

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
  double calculateBatteryVoltage(level){
    return ((6.144 * (level??0))/ (32767))*(20.5/3.6);
  }
  double calculatePercentage(level){
    double percentage = (calculateBatteryVoltage(level)-minimumBatteryLevel)/(maximumBatteryLevel-minimumBatteryLevel);
    return percentage;
  }

  double calculateAcValueFromAdc(ApplianceModel level){
    if(level.type.toString().startsWith('AC')){
      return (level.value??0) * (6.144/32767) * (220/1.82);
    }else{
      return calculateTemperature(level.value??0.0);
    }

  }
  double calculateTemperature(double adcValue) {
    double a = 1/T1;

    // double resistance = R_Series  *((32767.0 / adcValue));
    double resistance = R_Series  *((32767.0 / adcValue) - 1.0);
    double R2 = (R1*adcValue/(32767-adcValue));
    double b = math.log(R0/R2);
    double c = b/math.log(e);
    double d = c/B;
    double T2 = 1/(a-d);
    log('temp: ${T2-273}');

    double temperature = 1.0 / ((math.log(resistance / R0) / B) + (1.0 / 325.15)) - 273.15;
    log('temp: $temperature');
    return temperature;
  }
}