import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/make_model.dart';
import '../model/model_model.dart';

class VPICService {
  static const _base = 'https://vpic.nhtsa.dot.gov/api/vehicles';

  Future<List<VehicleMake>> fetchAllMakes() async {
    final uri = Uri.parse('$_base/getallmakes?format=json');
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      final body = json.decode(resp.body);
      final List<dynamic> results = body['Results'];
      return results.map((j) => VehicleMake.fromJson(j)).toList();
    }
    throw Exception('Failed to load makes');
  }

  Future<List<VehicleModel>> fetchModelsForMake(String makeName) async {
    final uri = Uri.parse(
        '$_base/getmodelsformake/${Uri.encodeComponent(makeName)}?format=json');

    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      var body;
      try {
        body = json.decode(resp.body);
      } catch (e) {
        return [];
      }
      final List<dynamic> results = body['Results'];
      return results.map((j) => VehicleModel.fromJson(j)).toList();
    }

    return [];
  }
}
