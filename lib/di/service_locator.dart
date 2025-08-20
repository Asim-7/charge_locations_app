import 'package:charge_locations_app/presentation/blocs/navigation/bottom_nav_cubit.dart';
import 'package:charge_locations_app/data/local/local_cache_service.dart';
import 'package:charge_locations_app/data/providers/api_provider.dart';
import 'package:charge_locations_app/data/repositories/charge_location_repository_impl.dart';
import 'package:charge_locations_app/domain/repositories/charge_location_repository.dart';
import 'package:charge_locations_app/domain/usecases/cached_locations_usecase.dart';
import 'package:charge_locations_app/domain/usecases/fetch_locations_usecase.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_bloc.dart';
import 'package:get_it/get_it.dart';

/// Dependency Injection instance
final diInstance = GetIt.instance;

/// Service Locator for dependency injection
void setupLocator() {
  // Register BottomNavCubit
  diInstance.registerLazySingleton(() => BottomNavCubit());

  // Register API provider
  diInstance.registerLazySingleton<ApiProvider>(() => ApiProvider());

  // Register cache service
  diInstance.registerLazySingleton(() => LocalCacheService());

  // Register CachedLocationsUsecase
  diInstance.registerLazySingleton(
    () => CachedLocationsUsecase(diInstance<LocalCacheService>()),
  );

  // Register repository
  diInstance.registerLazySingleton<ChargeLocationRepository>(
    () => ChargeLocationRepositoryImpl(apiProvider: diInstance<ApiProvider>()),
  );

  // Register FetchLocationsUsecase
  diInstance.registerLazySingleton(
    () => FetchLocationsUsecase(diInstance<ChargeLocationRepository>()),
  );

  // Register bloc
  diInstance.registerFactory(
    () => LocationSearchBloc(
      fetchLocations: diInstance<FetchLocationsUsecase>(),
      cachedLocationsUsecase: diInstance<CachedLocationsUsecase>(),
    ),
  );
}
