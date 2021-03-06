import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/IAccountRepository.dart';
import 'package:review_app/Interfaces/IBusinessRepository.dart';
import 'package:review_app/Interfaces/IBusinessTypeRepository.dart';
import 'package:review_app/Interfaces/ICategoryRepository.dart';
import 'package:review_app/Interfaces/ISubCategoryRepository.dart';
import 'package:review_app/Repositories/AccountRepository.dart';
import 'package:review_app/Repositories/BusinessRepository.dart';
import 'package:review_app/Repositories/BusinessTypeRepository.dart';
import 'package:review_app/Repositories/CategoryRepository.dart';
import 'package:review_app/Repositories/SubCategoryRepository.dart';

GetIt locator = GetIt.I;

void SetupLocator(){
  locator.registerLazySingleton(() => Logger());
  locator.registerLazySingleton(() => GetStorage());
  locator.registerLazySingleton<IAccountRepository>(() =>AccountRepository());
  locator.registerLazySingleton<IBusinessTypeRepository>(() =>BusinessTypeRepository());
  locator.registerLazySingleton<ICategoryRepository>(() =>CategoryRepository());
  locator.registerLazySingleton<IBusinessRepository>(() =>BusinessRepository());
  locator.registerLazySingleton<ISubCategoryRepository>(() =>SubCategoryRepository());
}