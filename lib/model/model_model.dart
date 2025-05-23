class VehicleModel {
  final int makeId;
  final int modelId;
  final String modelName;

  VehicleModel({
    required this.makeId,
    required this.modelId,
    required this.modelName,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      makeId: json['Make_ID'] as int,
      modelId: json['Model_ID'] as int,
      modelName: json['Model_Name'] as String,
    );
  }
}
