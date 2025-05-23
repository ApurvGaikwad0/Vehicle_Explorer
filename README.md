# Vehicle Explorer

A Flutter mobile application that retrieves and displays vehicle manufacturers (makes) and their models via the NHTSA vPIC public REST API. Users can browse, favorite, and manage their preferred manufacturers across app sessions.
-
In this project, I built a Flutter-based mobile application that integrates the NHTSA vPIC vehicle API, showcasing vehicle makes and their corresponding models. Initially, I selected the API Ninjas Car API but faced limitations due to premium-only fields. Consequently, I pivoted to the freely available NHTSA vPIC API to ensure complete data accessibility without restrictions. The application structure adheres to recommended best practices, leveraging Provider for state management, modular widget architecture, and persistent storage via SharedPreferences. Comprehensive tests were developed, including unit tests for API providers (VehicleProvider and VPICService), integration tests simulating user interactions, and widget tests for core UI components.


## Features
- **Manufacturer List**: Browse all vehicle makes
- **Model Details**: View models for each manufacturer
- **Favorites System**: Save favorite manufacturers
- **Offline Persistence**: Favorites saved between sessions
- **Comprehensive Testing**: Unit, widget, and integration tests

## Project Structure
```
vehicle-explorer/
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── services/
│   ├── providers/
│   ├── screens/
│   ├── widgets/
│   └── storage/
├── test/
│   ├── unit/
│   ├── widget/
│   └── integration_test/
└── pubspec.yaml
```

## Core Implementation
```dart
// lib/providers/vehicle_provider.dart
class VehicleProvider with ChangeNotifier {
  List<Make> _makes = [];
  List<int> _favorites = [];

  List<Make> get makes => _makes;
  List<int> get favorites => _favorites;

  Future<void> loadMakes() async {
    _makes = await VPICService().getAllMakes();
    notifyListeners();
  }

  void toggleFavorite(int makeId) {
    _favorites.contains(makeId) 
      ? _favorites.remove(makeId)
      : _favorites.add(makeId);
    notifyListeners();
  }
}
```

## API Service
```dart
// lib/services/vpic_service.dart
class VPICService {
  final String _baseUrl = "https://vpic.nhtsa.dot.gov/api/vehicles";

  Future<List<Make>> getAllMakes() async {
    final response = await http.get(Uri.parse("$_baseUrl/GetAllMakes?format=json"));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['Results'] as List)
          .map((json) => Make.fromJson(json))
          .toList();
    }
    throw Exception('Failed to load manufacturers');
  }
}
```

## Getting Started
```bash
# Clone repository
git clone https://github.com/yourusername/vehicle-explorer.git
cd vehicle-explorer

# Install dependencies
flutter pub get

# Generate serialization code
flutter pub run build_runner build

# Run application
flutter run
```

## Testing Suite
```bash
# Run all tests
flutter test --coverage

# Unit tests
flutter test test/unit/

# Widget tests
flutter test test/widget/

# Integration tests
flutter drive --driver=test_driver/integration_test.dart \
--target=integration_test/app_test.dart
```

## Configuration
| File | Purpose |
|------|---------|
| `lib/services/vpic_service.dart` | API endpoint configuration |
| `lib/storage/local_storage.dart` | Persistence settings |
