import 'package:career_aid/controller/auth/auth_controller.dart';
import 'package:career_aid/controller/auth/sign_up_controller.dart';
import 'package:career_aid/service/service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

setup() {
  //View Model
  getIt.registerSingleton<SignupController>(SignupController());
  getIt.registerSingleton<AuthController>(AuthController());

  // Services
  getIt.registerLazySingleton<HiveStorageService>(() => HiveStorageService());
}
