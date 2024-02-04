class ApplianceModel{
  String? type;
  int? value;
  String? unit;
  String? image;

  ApplianceModel({this.unit,this.value,this.type,this.image});
  factory ApplianceModel.fromJson(Map<dynamic,dynamic> jsonData){
    return ApplianceModel(
      type: jsonData['name'],
      value: jsonData['value'],
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