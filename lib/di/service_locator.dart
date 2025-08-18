import 'package:charge_locations_app/data/providers/api_provider.dart';
import 'package:charge_locations_app/data/repositories/charge_location_repository_impl.dart';
import 'package:charge_locations_app/domain/repositories/charge_location_repository.dart';
import 'package:charge_locations_app/domain/usecases/fetch_locations_usecase.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_bloc.dart';
import 'package:get_it/get_it.dart';

/// Dependency Injection instance
final diInstance = GetIt.instance;

/// Service Locator for dependency injection
void setupLocator() {
  // Register API provider
  diInstance.registerLazySingleton<ApiProvider>(() => ApiProvider());

  // Register repositorie
  diInstance.registerLazySingleton<ChargeLocationRepository>(
    () => ChargeLocationRepositoryImpl(apiProvider: diInstance<ApiProvider>()),
  );

  // Register usecase
  diInstance.registerLazySingleton(
    () => FetchLocationsUsecase(diInstance<ChargeLocationRepository>()),
  );

  // Register bloc
  diInstance.registerFactory(
    () => LocationSearchBloc(fetchLocations: diInstance()),
  );
}
