import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Repositories/AccountRepository.dart';

GetIt locator = GetIt.I;

void SetupLocator(){
  locator.registerLazySingleton(() => AccountRepository());
  locator.registerLazySingleton(() => Logger());
}