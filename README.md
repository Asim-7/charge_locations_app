
# Charge Locations App

A modern Flutter app to search for EV charge locations by city, view real-time availability, and see detailed information for each location. Built with Clean Architecture, BLoC, and a fully modular, themeable, and localizable codebase.

---

## Key Features

- **Search by City:** Find EV charging stations in any city with instant results.
- **Availability Status:** See real-time connector availability with color-coded icons and counts.
- **Detailed Station View:** View address, reviews, connector types, and book a charging slot.
- **Persistent Navigation:** Bottom navigation with stateful, modular screens.
- **Modern UI:** Card-based layouts, gradients, and fade effects for a professional look.
- **Localization Ready:** All user-facing strings are extracted for easy translation.
- **Centralized Theming:** All colors and styles are managed in `AppTheme` for consistency.
- **Clean Architecture:** Strict separation of Presentation, Domain, and Data layers for maintainability.

---

## Architecture & State Management

- **Clean Architecture:**
  - `lib/data/`: API, models, and repositories
  - `lib/domain/`: Use cases and business logic
  - `lib/presentation/`: UI, BLoC, widgets, and screens
- **BLoC Pattern:**
  - Predictable, testable state management
  - All business logic and async flows handled via BLoC
- **Dependency Injection:**
  - All dependencies managed via a service locator


**Why Clean Architecture?**  
- Makes code easy to test and extend  
- Separation of concerns: UI, business logic, and data access are decoupled  
- Facilitates robust error handling and future platform expansion

**Why Bloc State Management:**  
- Aligns with GreenFlux's current practices  
- Offers explicit event/state handling for robust, predictable state management  
- Scales well for larger, more complex applications  
- Well-supported and documented in Flutter ecosystem

---

## Project Structure (2025)

```
lib/
  constants/
    app_strings.dart
  data/
    models/
    providers/
    repositories/
  domain/
    usecases/
  presentation/
    blocs/
    screens/
    widgets/
      home/
      search/
      detail/
    ...
  theme/
    app_theme.dart
  utils/
    address_utils.dart
    status_utils.dart
main.dart
test/
  ...
```

---

## Theming & Localization

- **AppTheme:** All colors, shadows, and style constants are defined in `theme/app_theme.dart` and used throughout the app. No hardcoded colors in widgets.
- **AppStrings:** All user-facing strings are in `constants/app_strings.dart` for easy translation and i18n.

---

## Dependencies

- `flutter_bloc` — BLoC state management
- `http` — API requests
- `equatable` — Value equality for models and states
- `flutter_test` — Native testing
- `mockito` — Mocking for tests

---

## Setup Guide

1. **Clone the Repo:**
   ```sh
   git clone https://github.com/Asim-7/charge_locations_app.git
   ```
2. **Install Dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the App:**
   ```sh
   flutter run
   ```
4. **Run Tests:**
   ```sh
   flutter test
   ```
5. **API:**
   No API key required. Ensure network connectivity. The base URL is set in `constants/app_strings.dart`.

---

## Screenshots

*Add screenshots here.*

---
