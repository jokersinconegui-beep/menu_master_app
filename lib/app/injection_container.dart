import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:menu_master_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:menu_master_app/features/menu/data/datasource/menu_datasource.dart';
import 'package:menu_master_app/features/menu/data/repository/menu_repository_impl.dart';
import 'package:menu_master_app/features/menu/domain/repository/menu_repository.dart';
import 'package:menu_master_app/features/menu/domain/usecase/get_categories.dart';
import 'package:menu_master_app/features/menu/domain/usecase/get_products_by_category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/api_constants.dart';

// Auth
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/sign_in.dart';
import '../features/auth/domain/usecases/sign_out.dart';
import '../features/auth/domain/usecases/get_current_user.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

import '../features/menu/presentation/bloc/menu_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  
  // Dio
  getIt.registerSingleton<Dio>(_createDio());
  
  // Auth
  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerSingleton<SignInUseCase>(
    SignInUseCase(getIt<AuthRepository>()),
  );
  getIt.registerSingleton<SignOutUseCase>(
    SignOutUseCase(getIt<AuthRepository>()),
  );
  getIt.registerSingleton<GetCurrentUserUseCase>(
    GetCurrentUserUseCase(getIt<AuthRepository>()),
  );
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInUseCase: getIt<SignInUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      signOutUseCase: getIt<SignOutUseCase>(),
    ),
  );
  
  // Menu
  getIt.registerSingleton<MenuDataSource>(
    MenuDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerSingleton<MenuRepository>(
    MenuRepositoryImpl(
      remoteDataSource: getIt<MenuRemoteDataSource>(),
    ),
  );
  getIt.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase(getIt<MenuRepository>()),
  );
  getIt.registerSingleton<GetProductsByCategoryUseCase>(
    GetProductsByCategoryUseCase(getIt<MenuRepository>()),
  );
  getIt.registerFactory<MenuBloc>(
    () => MenuBloc(
      getCategoriesUseCase: getIt<GetCategoriesUseCase>(),
      getProductsByCategoryUseCase: getIt<GetProductsByCategoryUseCase>(),
    ),
  );
}

Dio _createDio() {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {'Content-Type': 'application/json'},
  ));
  
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
  ));
  
  return dio;
}