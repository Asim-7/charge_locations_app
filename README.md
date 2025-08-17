# Charge Locations App

A Flutter mobile app that lets users search for EV charge locations by city, view a list of locations with availability status, and see detailed information about each charge location.

## Architectural Pattern

**Architecture:** I chose the Clean Architecture approach, separating the app into layers: Presentation, Domain, and Data. This ensures testability, scalability, and maintainability. The Presentation layer uses BLoC for state management, Domain layer contains business logic, and Data layer handles API integration and parsing.

**Why Clean Architecture?**  
- Makes code easy to test and extend  
- Separation of concerns: UI, business logic, and data access are decoupled  
- Facilitates robust error handling and future platform expansion

## State Management Choice

**Chosen:** BLoC (Business Logic Components) state management
**Justification:**  
- Aligns with GreenFlux's current practices  
- Offers explicit event/state handling for robust, predictable state management  
- Scales well for larger, more complex applications  
- Well-supported and documented in Flutter ecosystem

## Project Structure

```
lib/
  data/
    models/
      charge_location.dart
      evse.dart
    repositories/
      charge_location_repository.dart
    providers/
      api_provider.dart
  domain/
    usecases/
      fetch_locations.dart
      fetch_location_detail.dart
  presentation/
    blocs/
      location_search_bloc.dart
      location_detail_bloc.dart
    screens/
      search_screen.dart
      detail_screen.dart
    widgets/
      location_list_item.dart
      evse_detail_tile.dart
main.dart
test/
  data/
    models/
      charge_location_test.dart
  presentation/
    blocs/
      location_search_bloc_test.dart
```

## Dependencies

- **flutter_bloc:** BLoC state management
- **http:** For API requests
- **equatable:** For value equality in models/BLoC states
- **flutter_test:** Native testing
- **mockito:** For mocking API responses in tests

## Challenges & Solutions

- **API Structure:** The API models required careful parsing, especially for EVSE list/count and status computation. I isolated parsing logic in `models/` and wrote tests.
- **Availability Indicator:** Needed to dynamically calculate and display an icon based on EVSE availability ratio. Solved using helper methods in the model and custom widget.
- **Error Handling:** Implemented error states in BLoC, showing error messages and retry options in UI.

## Setup Guide

1. **Clone the Repo:**  
   `git clone https://github.com/Asim-7/charge_locations_app.git`

2. **Install Dependencies:**  
   `flutter pub get`

3. **Run the App:**  
   `flutter run`

4. **Run Tests:**  
   `flutter test`

5. **API:**  
   No API key required. Ensure network connectivity. The base URL is set in `api_provider.dart`.

## Screenshots

*Add screenshots here.*

---
