import 'dart:math';
import '../data/vehicle_images.dart';

class VehicleMake {
  final int makeId;
  final String makeName;
  final String image;

  VehicleMake({
    required this.makeId,
    required this.makeName,
    required this.image,
  });

  factory VehicleMake.fromJson(Map<String, dynamic> json) {
    return VehicleMake(
      makeId: json['Make_ID'] as int,
      makeName: json['Make_Name'] as String,
      image: vehicleImages[Random().nextInt(vehicleImages.length)],
    );
  }
}
