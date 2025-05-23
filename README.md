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
