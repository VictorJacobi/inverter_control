import 'dart:developer';

class ApplianceModel{
  String? type;
  double? value;
  String? unit;
  String? image;

  ApplianceModel({this.unit,this.value,this.type,this.image});
  factory ApplianceModel.fromJson(Map<dynamic,dynamic> jsonData){
    log('$jsonData');
    return ApplianceModel(
      type: jsonData['name'],
      value: jsonData['value']?.toDouble(),
      unit: jsonData['unit'],
      image: jsonData['image'],
    );
  }

  @override
  String toString() => """
  type: $type,
  value: $value,
  unit: $unit
  image: $image""";
}