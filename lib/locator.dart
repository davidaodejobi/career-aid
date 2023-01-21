import 'package:career_aid/service/service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

setup() {
  //View Model

  // Services
  getIt.registerLazySingleton<HiveStorageService>(() => HiveStorageService());
}
