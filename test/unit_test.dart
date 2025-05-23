import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:cs442_mp6/provider/vehicle_provider.dart';
import 'package:cs442_mp6/service/vpic_service.dart';

void main() {
  group('VehicleProvider', () {
    test('fetchMakes should update makes when successful', () async {
      final provider = VehicleProvider();
      await provider.fetchMakes();

      expect(provider.makes.isNotEmpty, true,
          reason: 'Expected at least one make from VPIC');
    });

    test('fetchModels should update models when successful for a known make',
        () async {
      final provider = VehicleProvider();

      await provider.fetchMakes();
      final someMake = provider.makes.first.makeName;

      await provider.fetchModels(someMake);
      expect(provider.models, isNotNull,
          reason: 'provider.models should not be null even if empty');
    });
  });

  group('VPICService raw HTTP', () {
    final service = VPICService();

    test('fetchAllMakes returns non-empty list', () async {
      final makes = await service.fetchAllMakes();
      expect(makes.isNotEmpty, true,
          reason: 'VPICService.fetchAllMakes should return at least one make');
    });

    test('fetchModelsForMake returns list (possibly empty) for "HONDA"',
        () async {
      final models = await service.fetchModelsForMake('HONDA');
      expect(models, isNotNull,
          reason: 'VPICService.fetchModelsForMake should not return null');
    });

    test('HTTP GET getallmakes endpoint responds 200', () async {
      final uri = Uri.parse(
          'https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=json');
      final resp = await http.get(uri);
      expect(resp.statusCode, 200);
      expect(resp.body.isNotEmpty, true);
    });
  });
}
