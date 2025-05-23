# Vehicle_Explorer
Flutter mobile app integrating NHTSA vPIC API to display vehicle makes and models. Initially used API Ninjas Car API but switched to free vPIC API for unrestricted data. Follows best practices with Provider state management, modular widgets, SharedPreferences, and comprehensive unit, widget, and integration tests.

# Vehicle Explorer

A Flutter mobile application that retrieves and displays vehicle manufacturers (makes) and their models via the NHTSA vPIC public REST API. Users can browse, favorite, and manage their preferred manufacturers across app sessions.

---

## Table of Contents

1. [Features](#features)  
2. [Tech Stack](#tech-stack)  
3. [Getting Started](#getting-started)  
   - [Prerequisites](#prerequisites)  
   - [Installation](#installation)  
   - [Running the App](#running-the-app)  
4. [Configuration](#configuration)  
5. [Architecture & Folder Structure](#architecture--folder-structure)  
6. [State Management](#state-management)  
7. [Local Persistence](#local-persistence)  
8. [Testing](#testing)  
   - [Unit Tests](#unit-tests)  
   - [Widget Tests](#widget-tests)  
   - [Integration Tests](#integration-tests)  
9. [Error Handling & Troubleshooting](#error-handling--troubleshooting)  
10. [Future Enhancements](#future-enhancements)  
11. [License](#license)  

---

## Features

- **List of Vehicle Makers**  
  Fetches and displays all manufacturers from the NHTSA vPIC API.

- **Models Detail View**  
  Tap on a make to see its available vehicle models.

- **Favorites Management**  
  Mark/unmark makers as favorites; view all favorites on a dedicated page.

- **Persistent Storage**  
  Favorites survive app restarts via SharedPreferences.

- **Robust Testing**  
  - Unit tests for API service and provider  
  - Widget tests for core UI components  
  - Integration tests covering full user flow  

---

## Tech Stack

- **Flutter & Dart** – UI framework and language  
- **Provider** – State management  
- **HTTP** – REST API calls  
- **SharedPreferences** – Local key–value persistence  
- **Mockito** – Mocking for tests  
- **Flutter Test & Integration Test** – Testing framework  

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) ≥ 3.0.0  
- Android Studio or Xcode (for iOS)  
- A device or emulator/simulator  

### Installation

1. **Clone the repo**  
   ```bash
   git clone https://github.com/yourusername/vehicle-explorer.git
   cd vehicle-explorer

Fetch dependencies
```bash
flutter pub get
```
Generate any code (if applicable)
```
flutter pub run build_runner build --delete-conflicting-outputs
```
Running the App

```bash
flutter run
```

Specify a device if you have multiple connected, e.g.:

```bash
flutter run -d emulator-5554
```

Configuration
By default, the app points at the public NHTSA vPIC endpoint:

```perl
https://vpic.nhtsa.dot.gov/api/vehicles/GetAllMakes?format=json
```

If you wish to point at a different endpoint or add an API key, adjust the base URL in:
```
bash
lib/services/vpic_service.dart
```

Architecture & Folder Structure
```
bash
lib/
├── main.dart                # App entry point
├── models/                  # Data classes (Make, Model, etc.)
├── services/                # API calls (VPICService)
├── providers/               # State management (VehicleProvider)
├── screens/                 # Presentation layer (Home, Details, Favorites)
├── widgets/                 # Reusable UI components
├── utils/                   # Helpers (e.g., URL encoders)
└── storage/                 # SharedPreferences helper
test/
├── unit/                    # Unit tests for services & providers
├── widget/                  # Widget tests
└── integration_test/        # End-to-end integration tests
```

##State Management
We use the Provider package:

VehicleProvider

Fetches and caches the makes list.

Holds the “current” make for the details page.

Manages the favorites list in memory and syncs with local storage.

Local Persistence
Favorites are saved using SharedPreferences:

Key: favorite_makes

Stored as a JSON-encoded List<int> of make IDs.

Loaded on app startup; updated when user toggles favorites.

