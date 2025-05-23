import 'package:flutter/material.dart';
import '../model/make_model.dart';
import '../model/model_model.dart';
import '../service/vpic_service.dart';

class VehicleProvider with ChangeNotifier {
  final VPICService _service = VPICService();

  List<VehicleMake> _makes = [];
  List<VehicleModel> _models = [];
  bool _isLoading = false;

  List<VehicleMake> get makes => _makes;
  List<VehicleModel> get models => _models;
  bool get isLoading => _isLoading;

  Future<void> fetchMakes() async {
    _isLoading = true;
    _makes = await _service.fetchAllMakes();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchModels(String makeName) async {
    _isLoading = true;
    _models = await _service.fetchModelsForMake(makeName);
    _isLoading = false;
    notifyListeners();
  }
}
